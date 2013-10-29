//
//  AVPlayerItem+Create.m
//  SimpleRadioPlayer
//
//  Created by Julietta Yaunches on 29/10/13.
//  Copyright (c) 2013 Julietta Yaunches. All rights reserved.
//

#import "AVPlayerItem+Create.h"

@implementation AVPlayerItem (Create)

+ (id)initForKdwb {
    NSURL *kdwbUrl = [NSURL URLWithString:@"http://ec2-23-20-195-55.compute-1.amazonaws.com:80/kdwb-fm/playlist.m3u8"];
    AVURLAsset *asset = [AVURLAsset URLAssetWithURL:kdwbUrl options:nil];
    return [AVPlayerItem playerItemWithAsset:asset];
}
@end
