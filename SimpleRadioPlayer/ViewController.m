//
//  ViewController.m
//  SimpleRadioPlayer
//
//  Created by Julietta Yaunches on 28/10/13.
//  Copyright (c) 2013 Julietta Yaunches. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>

NSString *kTracksKey = @"tracks";
NSString *kStatusKey = @"status";
NSString *kRateKey = @"rate";
NSString *kPlayableKey = @"playable";
NSString *kCurrentItemKey = @"currentItem";
NSString *kTimedMetadataKey = @"currentItem.timedMetadata";

static void *ItemStatusContext = &ItemStatusContext;
static void *CurrentPlayerItemReplaced = &CurrentPlayerItemReplaced;


@interface ViewController ()
@property(retain) AVPlayerItem *playerItem;
@property(nonatomic, strong) AVPlayer *player;
@end

@implementation ViewController
- (IBAction)playClicked:(id)sender {
    [self.player play];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    NSURL *newMovieURL = [NSURL URLWithString:@"http://ec2-23-20-195-55.compute-1.amazonaws.com:80/kdwb-fm/playlist.m3u8"];
    if ([newMovieURL scheme]) {
        AVURLAsset *asset = [AVURLAsset URLAssetWithURL:newMovieURL options:nil];
        self.playerItem = [AVPlayerItem playerItemWithAsset:asset];

        [self.playerItem addObserver:self
                          forKeyPath:kStatusKey
                             options:NSKeyValueObservingOptionInitial | NSKeyValueObservingOptionNew
                             context:&ItemStatusContext];
        
        self.player = [AVPlayer playerWithPlayerItem:self.playerItem];

        [self.player addObserver:self
                      forKeyPath:kCurrentItemKey
                         options:NSKeyValueObservingOptionInitial | NSKeyValueObservingOptionNew
                         context:CurrentPlayerItemReplaced];

    }
}

- (void)observeValueForKeyPath:(NSString *)path
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context {
    /* AVPlayerItem "status" property value observer. */
    if (context == ItemStatusContext) {
        AVPlayerStatus status = [[change objectForKey:NSKeyValueChangeNewKey] integerValue];
        switch (status) {
            case AVPlayerStatusUnknown: {
                NSLog(@"status unknown");
            }
                break;
            case AVPlayerStatusReadyToPlay: {
                [self.playButton setHidden:NO];
                NSLog(@"status ready to play");
            }
                break;
            case AVPlayerStatusFailed: {
                NSLog(@"status failed");
            }
                break;
        }

    } else if (context == CurrentPlayerItemReplaced){
        NSLog(@"Current item replaced");
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
