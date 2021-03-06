//
//  NMQueue.h
//  Task
//
//  Created by yangfan on 2018/3/2.
//  Copyright © 2018年 yangfan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NMQueue<__covariant ObjectType> : NSObject

- (ObjectType)front;

- (ObjectType)back;

- (void)enqueue:(ObjectType)object;

- (void)dequeue;

- (void)removeAll;

- (BOOL)isEmpty;

@end
