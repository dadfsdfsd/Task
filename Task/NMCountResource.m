//
//  NMCountResource.m
//  Task
//
//  Created by yangfan on 2018/3/2.
//  Copyright © 2018年 yangfan. All rights reserved.
//

#import "NMCountResource.h"

@interface NMCountResource () {

    NSInteger _count;
    
}

@end

@implementation NMCountResource

- (instancetype)initWithCapacity:(NSInteger)capacity releaseObserver:(NMCountResourceReleaseObserver)observer {
    if (self = [super init]) {
        _capacity = capacity;
        _observer = observer;
    }
    return self;
}

- (BOOL)available {
    return _count < _capacity;
}

- (BOOL)hold {
    if (_count < _capacity) {
        _count += 1;
        return true;
    }
    return false;
}

- (void)releaseSource {
    if (_count > 0) {
        _count -= 1;
        _observer();
    }
}

@end

@implementation NMNoLimitResource

- (BOOL)available {
    return true;
}

- (BOOL)hold {
    return true;
}

- (void)releaseSource {
    
}

@end
