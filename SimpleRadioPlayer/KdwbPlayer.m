//
// Created by Julietta Yaunches on 29/10/13.
// Copyright (c) 2013 Julietta Yaunches. All rights reserved.
//
#import "KdwbPlayer.h"
#import "PlayerStatusDelegate.h"
#import "AVPlayerItem+Create.h"

NSString *kStatusKey = @"status";
static void *ItemStatusContext = &ItemStatusContext;

@interface KdwbPlayer ()
@property(nonatomic, strong) AVPlayer *player;
@end

@implementation KdwbPlayer

+ (KdwbPlayer *)kdwbPlayer {
    static KdwbPlayer *kdwbPlayer = nil;
    if (!kdwbPlayer)
        kdwbPlayer = [[KdwbPlayer alloc] init];

    return kdwbPlayer;
}

- (void)play {
    AVPlayerItem *item = [self initializePlayerItem];
    if (self.player == nil) {
        self.player = [AVPlayer playerWithPlayerItem:item];
    } else {
        [self.player replaceCurrentItemWithPlayerItem:item];
    }
}

- (void)pause {
    [self.player pause];
}

- (AVPlayerItem *)initializePlayerItem {
    AVPlayerItem *playerItem = [AVPlayerItem initForKdwb];
    [playerItem addObserver:self
                 forKeyPath:kStatusKey
                    options:NSKeyValueObservingOptionInitial | NSKeyValueObservingOptionNew
                    context:&ItemStatusContext];
    return playerItem;
}

- (void)observeValueForKeyPath:(NSString *)path
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context {
    if (context == ItemStatusContext) {
        AVPlayerStatus status = [[change objectForKey:NSKeyValueChangeNewKey] integerValue];
        if (status == AVPlayerStatusReadyToPlay) {
            NSLog(@"Ready to play");
            [self.player play];
            [self.delegate playerPlaying];
        }
    }
}

- (BOOL)isPlaying {
    return [self.player rate] != 0.0;
}

@end