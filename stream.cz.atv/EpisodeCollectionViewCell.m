//
//  EpisodeCollectionViewCell.m
//  stream.cz.atv
//
//  Created by Lukas Jezny on 22/09/15.
//  Copyright © 2015 Lukas Jezny. All rights reserved.
//

#import "EpisodeCollectionViewCell.h"
#import "UIImage+Helpers.h"

@implementation EpisodeCollectionViewCell{
}

-(void) setupForEpisode:(Episode*)episode{
    if(self.currentEpisode!=episode){
        self.currentEpisode = episode;
        self.episodeLabel.text = episode.name;
        self.episodeImage.image = nil;
        [UIImage loadFromStreamLink:episode.imageLink callback:^(UIImage *image, NSString *stream_link) {
            if([self.currentEpisode.imageLink compare:stream_link] == NSOrderedSame){
                self.episodeImage.image = image;
            }
        }];
    }
}


@end
