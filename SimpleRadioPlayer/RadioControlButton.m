//
//  RadioControlButton.m
//  SimpleRadioPlayer
//
//  Created by Julietta Yaunches on 29/10/13.
//  Copyright (c) 2013 Julietta Yaunches. All rights reserved.
//

#import "RadioControlButton.h"

@interface RadioControlButton ()
@property(nonatomic, strong) UIImage *pauseImage;
@property(nonatomic, strong) UIImage *playImage;
@end

@implementation RadioControlButton

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.pauseImage = [UIImage imageNamed:@"pause-icon.png"];
        self.playImage = [UIImage imageNamed:@"play-icon.png"];
    }
    return self;
}

- (void)moveToPausedState {
    [self setEnabled:YES];
    [self setImage:self.playImage forState:UIControlStateNormal];
}

- (void)moveToPlayingState {
    [self setEnabled:YES];
    [self setImage:self.pauseImage forState:UIControlStateNormal];
}

- (void)moveToGettingReadyToPlayState {
    [self setEnabled:NO];
    [self setImage:self.pauseImage forState:UIControlStateNormal];
}
@end
