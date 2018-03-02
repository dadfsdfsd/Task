//
//  NMCountResource.h
//  Task
//
//  Created by yangfan on 2018/3/2.
//  Copyright © 2018年 yangfan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NMConsumer.h"

typedef void(^NMCountResourceReleaseObserver)(void);

@interface NMCountResource : NSObject<NMAbstractResource>

@property (nonatomic, assign) NSInteger capacity;

@property (nonatomic, strong) NMCountResourceReleaseObserver observer;

- (instancetype)initWithCapacity:(NSInteger)capacity releaseObserver:(NMCountResourceReleaseObserver)observer;


@end

@interface NMNoLimitResource : NSObject<NMAbstractResource>


@end
