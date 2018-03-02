//
//  NMConsumer.h
//  Task
//
//  Created by yangfan on 2018/3/2.
//  Copyright © 2018年 yangfan. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^NMConsumerAccessCompletion)(void);

@protocol NMAbstractConsumer<NSObject>

- (void)access:(NMConsumerAccessCompletion)completion;

- (BOOL)isDuplicate:(id<NMAbstractConsumer>)consumer;

- (BOOL)isOpposite:(id<NMAbstractConsumer>)consumer;

@end


@protocol NMAbstractResource

- (BOOL)available;

- (BOOL)hold;

- (void)releaseSource;

@end
