//
//  StreamAVPlayerViewController.m
//  stream.cz.atv
//
//  Created by Lukas Jezny on 23/09/15.
//  Copyright © 2015 Lukas Jezny. All rights reserved.
//

#import "StreamAVPlayerViewController.h"
#import "VideoQuality.h"
#import "VideoFormat.h"
#import "MRegLinks.h"
#import "MRegg.h"
#import "ApiClient.h"

@interface StreamAVPlayerViewController ()

@end

@implementation StreamAVPlayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    /*
    UIButton *b = [UIButton buttonWithType:UIButtonTypeSystem];
    [b setTitle:@"XX" forState:UIControlStateNormal];
    //[self.contentOverlayView addSubview:b];*/
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void) setEpisode:(Episode *)episode{
    _episode = episode;
    
    MRegg *reg = [episode.mregg objectAtIndex:0];
    
    [[ApiClient sharedApiClient] getMReggLinksForZone:reg.zone_id collocation:reg.collocation section:reg.section options:reg.options WithCompletionHandler:^(MRegLinks * _Nullable links) {
        
        NSMutableArray<AVPlayerItem *> *items = [[NSMutableArray<AVPlayerItem *> alloc]init];
        
        if(links!=nil){
            VideoFormat* adVF = [self getBestFormat:links.video_qualities forRequiredQuality:self.quality];
            
            if(adVF!=nil && [self.episode.mregg_before intValue] > 0)
            {
                [items addObject:[AVPlayerItem playerItemWithURL:[NSURL URLWithString:adVF.source]]];
            }
        }
        VideoFormat *episodeVF = [self getBestFormat:episode.video_qualities forRequiredQuality:self.quality];
        if(episodeVF!=nil){
            AVPlayerItem *episodePlayerItem = [AVPlayerItem playerItemWithURL:[NSURL URLWithString:episodeVF.source]];
            
            [items addObject:episodePlayerItem];
        }
        
        if(links!=nil){
            VideoFormat* adVF = [self getBestFormat:links.video_qualities forRequiredQuality:self.quality];
            
            if(adVF!=nil && [self.episode.mregg_after intValue] > 0)
            {
               [items addObject:[AVPlayerItem playerItemWithURL:[NSURL URLWithString:adVF.source]]];
            }
        }

        AVPlayerItem *lastItem = [items lastObject];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(itemDidFinishPlaying:) name:AVPlayerItemDidPlayToEndTimeNotification object:lastItem];
        
        self.player = [AVQueuePlayer queuePlayerWithItems:items];
        [self.player play];
        
    }];
   
}

-(void)itemDidFinishPlaying:(NSNotification *) notification {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:^{
        
    }];
    
}

-(VideoFormat*) getBestFormat:(NSArray*) qualities forRequiredQuality:(NSString*)quality{
    VideoFormat *result = nil;
    for (VideoQuality *vq in qualities) {
        for (VideoFormat *vf in vq.formats) {
            if([@"video/mp4" compare:vf.type] == NSOrderedSame){
                result = vf;
                if([vf.quality compare:self.quality] == NSOrderedSame){
                    return result;
                }
                
            }
        }
    }
    if(result == nil){
        //fallback to any unknown format
        for (VideoQuality *vq in qualities) {
            for (VideoFormat *vf in vq.formats) {
                    result = vf;
                    break;
            }
        }
    }
    return result;
}

@end
