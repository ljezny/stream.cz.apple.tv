//
//  EpisodeCollectionViewCell.h
//  stream.cz.atv
//
//  Created by Lukas Jezny on 22/09/15.
//  Copyright © 2015 Lukas Jezny. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Episode.h"

@interface EpisodeCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *episodeLabel;
@property (weak, nonatomic) IBOutlet UIImageView *episodeImage;
@property Episode *currentEpisode;
-(void) setupForEpisode:(Episode*)episode;

@end
