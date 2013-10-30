//
//  ViewController.m
//  SimpleRadioPlayer
//
//  Created by Julietta Yaunches on 28/10/13.
//  Copyright (c) 2013 Julietta Yaunches. All rights reserved.
//

#import "RadioDisplayController.h"
#import "KdwbPlayer.h"
#import "RadioControlButton.h"

@interface RadioDisplayController ()
@property(nonatomic, strong) KdwbPlayer *kdwbPlayer;
@end

@implementation RadioDisplayController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.playButton moveToPausedState];
    self.kdwbPlayer = [KdwbPlayer kdwbPlayer];
    [self.kdwbPlayer setDelegate:self];
}

- (IBAction)playClicked:(id)sender {
    if (self.kdwbPlayer.isPlaying){
        [self.kdwbPlayer pause];
        [self.playButton moveToPausedState];
    }else {
        [self.kdwbPlayer play];
        [self.playButton moveToGettingReadyToPlayState];
    }
}

- (void)playerPlaying {
    [self.playButton moveToPlayingState];
}


@end
