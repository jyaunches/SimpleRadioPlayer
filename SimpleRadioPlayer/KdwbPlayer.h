//
// Created by Julietta Yaunches on 29/10/13.
// Copyright (c) 2013 Julietta Yaunches. All rights reserved.
//


#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@protocol PlayerStatusDelegate;

@interface KdwbPlayer : NSObject
+ (KdwbPlayer *)kdwbPlayer;
- (AVPlayerItem *)initializePlayerItem;
@property (nonatomic,assign) id<PlayerStatusDelegate> delegate;

- (BOOL)isPlaying;
- (void)pause;
- (void)play;
@end