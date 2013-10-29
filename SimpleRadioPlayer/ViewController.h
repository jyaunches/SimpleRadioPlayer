//
//  ViewController.h
//  SimpleRadioPlayer
//
//  Created by Julietta Yaunches on 28/10/13.
//  Copyright (c) 2013 Julietta Yaunches. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlayerStatusDelegate.h"

@class AVPlayer;
@class KdwbPlayer;
@class RadioControlButton;

@interface ViewController : UIViewController <PlayerStatusDelegate>
@property (weak, nonatomic) IBOutlet RadioControlButton *playButton;
@end
