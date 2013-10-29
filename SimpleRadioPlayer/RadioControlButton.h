//
//  RadioControlButton.h
//  SimpleRadioPlayer
//
//  Created by Julietta Yaunches on 29/10/13.
//  Copyright (c) 2013 Julietta Yaunches. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RadioControlButton : UIButton
- (void)moveToPausedState;
- (void)moveToPlayingState;
- (void)moveToGettingReadyToPlayState;
@end
