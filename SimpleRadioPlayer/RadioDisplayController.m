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
#import "Reachability.h"

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
    if([Reachability internetNotReachable]){
        [[[UIAlertView alloc]
                initWithTitle:@"Can't reach the internet."
                      message:@"Check you are connected!"
                     delegate:nil
            cancelButtonTitle:@"OK"
            otherButtonTitles:nil] show];
    }else{
        [self playOrPause];
    }
}

- (void)playOrPause {
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
