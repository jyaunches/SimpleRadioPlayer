//
//  RadioControlButton.m
//  SimpleRadioPlayer
//
//  Created by Julietta Yaunches on 29/10/13.
//  Copyright (c) 2013 Julietta Yaunches. All rights reserved.
//

#import "RadioControlButton.h"

@implementation RadioControlButton

- (void)moveToPausedState {
    [self setEnabled:YES];
    [self setTitle:@"Play" forState:UIControlStateNormal];
}

- (void)moveToPlayingState {
    [self setEnabled:YES];
    [self setTitle:@"Pause" forState:UIControlStateNormal];
}

- (void)moveToGettingReadyToPlayState {
    [self setEnabled:NO];
    [self setTitle:@"Pause" forState:UIControlStateNormal];
}
@end
