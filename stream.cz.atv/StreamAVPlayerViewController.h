//
//  StreamAVPlayerViewController.h
//  stream.cz.atv
//
//  Created by Lukas Jezny on 23/09/15.
//  Copyright © 2015 Lukas Jezny. All rights reserved.
//

#import <AVKit/AVKit.h>
#import "Episode.h"
@interface StreamAVPlayerViewController : AVPlayerViewController

@property (nonatomic)Episode *episode;
@property NSString *quality;
@end
