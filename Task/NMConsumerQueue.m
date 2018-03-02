//
//  NMConsumerQueue.m
//  Task
//
//  Created by yangfan on 2018/3/2.
//  Copyright © 2018年 yangfan. All rights reserved.
//

#import "NMConsumerQueue.h"
#import "NMCountResource.h"
#import "NMQueue.h"

@interface NMConsumerQueue()

@property (nonatomic, strong) NMQueue<id<NMAbstractConsumer>> *queue;

@property (nonatomic, strong) id<NMAbstractResource> resource;

@end

@implementation NMConsumerQueue

- (instancetype)initWithConcurrentCount:(NSUInteger)concurrentCount {
    if (self = [super init]) {
        if (concurrentCount == 0) {
            _resource = [NMNoLimitResource new];
        }
        else {
            __weak __typeof(self) weakSelf = self;
            _resource = [[NMCountResource alloc] initWithCapacity:concurrentCount releaseObserver:^{
                [weakSelf schedule];
            }];
        }
    }
    return self;
}

- (void)schedule {
    while ([_resource available] && ![_queue isEmpty]) {
        id<NMAbstractConsumer> consumer = [_queue front];
        [_queue dequeue];
        id<NMAbstractConsumer> nextConsumer = [_queue front];
        if (nextConsumer) {
            if ([consumer isDuplicate:nextConsumer]) {
                continue;
            }
            if ([consumer isOpposite:nextConsumer]) {
                [_queue dequeue];
                continue;
            }
        }
        [self grantAccess:consumer];
    };
}

- (void)equeue:(id<NMAbstractConsumer>)consumer {
    if ([_resource available]) {
        [self grantAccess:consumer];
    }
    else {
         [_queue enqueue:consumer];
    }
}

- (void)grantAccess:(id<NMAbstractConsumer>)consumer {
    if ([_resource hold]) {
        __weak __typeof(self) weakSelf = self;
        [consumer access:^{
            [weakSelf.resource releaseSource];
        }];
    }
}

@end
