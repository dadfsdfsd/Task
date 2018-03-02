//
//  NMTask.h
//  Task
//
//  Created by yangfan on 2018/3/2.
//  Copyright © 2018年 yangfan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NMConsumer.h"

typedef NS_ENUM (NSInteger, NMTaskState) {
    NMTaskStateInitial,
    NMTaskStateRunning,
    NMTaskStateFulfilled,
    NMTaskStateCancelled
};

@interface NMTask : NSObject<NMAbstractConsumer>

@property (nonatomic, assign, readonly) NMTaskState state;

@property (nonatomic, assign, readonly) NSInteger taskId;


@end
