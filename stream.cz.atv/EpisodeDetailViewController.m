//
//  EpisodeDetailViewController.m
//  stream.cz.atv
//
//  Created by Lukas Jezny on 22/09/15.
//  Copyright © 2015 Lukas Jezny. All rights reserved.
//

#import "EpisodeDetailViewController.h"
#import "StreamAVPlayerViewController.h"
#import "ApiClient.h"
#import "UIImage+Helpers.h"
#import "EpisodeCollectionViewController.h"
#import "ShowDetailViewController.h"
@interface EpisodeDetailViewController ()

@end

@implementation EpisodeDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if([@"PlayEpisodeFullHD" compare:segue.identifier] == NSOrderedSame){
        [(StreamAVPlayerViewController*) segue.destinationViewController setQuality:@"1080p"];
        [(StreamAVPlayerViewController*) segue.destinationViewController setEpisode:self.episode];
    }
    if([@"PlayEpisodeHD" compare:segue.identifier] == NSOrderedSame){
        [(StreamAVPlayerViewController*) segue.destinationViewController setQuality:@"720p"];
        [(StreamAVPlayerViewController*) segue.destinationViewController setEpisode:self.episode];
    }
    if([@"PlayEpisodeSD" compare:segue.identifier] == NSOrderedSame){
        [(StreamAVPlayerViewController*) segue.destinationViewController setQuality:@"480p"];
        [(StreamAVPlayerViewController*) segue.destinationViewController setEpisode:self.episode];
    }
    if([@"ShowShowDetail" compare:segue.identifier] == NSOrderedSame){
        [(ShowDetailViewController*) segue.destinationViewController setShow:self.episode.show];
    }
}

-(void) updateUI{
    [UIImage loadFromStreamLink:self.episode.imageLink callback:^(UIImage *image, NSString *stream_link) {
        self.blurBackgroundImageView.image = image;
        self.posterImage.image = image;
    }];
    self.titleLabel.text = self.episode.name;
    self.descriptionLabel.text = [self.episode perex];
    [[self episodeCollectionViewController] setEpisodeList:self.episode.recommended];
    
    [UIImage loadFromStreamLink:self.episode.show.image_link callback:^(UIImage *image, NSString *stream_link) {
        [self.showButton setBackgroundImage:image forState:UIControlStateNormal];
    }];
}
-(EpisodeCollectionViewController*) episodeCollectionViewController{
    return [self.childViewControllers firstObject];
}

-(void) setEpisode:(Episode *)episode{
    _episode = episode;
    
    [[ApiClient sharedApiClient] loadModelOnDemand:self.episode withCompletionHandler:^(Model * _Nullable root) {
            [self updateUI];
    }];
    
}

@end
