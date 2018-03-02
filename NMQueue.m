//
//  NMQueue.m
//  Task
//
//  Created by yangfan on 2018/3/2.
//  Copyright © 2018年 yangfan. All rights reserved.
//

#import "NMQueue.h"

@interface NMQueue() {
    
    NSMutableArray *_list;
    
}

@end

@implementation NMQueue

- (instancetype)init {
    if (self = [super init]) {
        _list = [NSMutableArray array];
    }
    return self;
}

- (id)front {
    return [_list firstObject];
}

- (id)back {
    return [_list lastObject];
}

- (void)enqueue:(NSObject *)object {
    [_list addObject:object];
}

- (void)dequeue {
    if (_list.count > 0) {
        [_list removeObjectAtIndex:0];
    }
}

- (void)removeAll {
    [_list removeAllObjects];
}

- (BOOL)isEmpty {
    return _list.count > 0;
}

@end
