//
//  EpisodeCollectionViewController.h
//  stream.cz.atv
//
//  Created by Lukas Jezny on 22/09/15.
//  Copyright © 2015 Lukas Jezny. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EpisodeList.h"
#import "Episode.h"
@interface EpisodeCollectionViewController : UICollectionViewController

@property (nonatomic) EpisodeList *episodeList;

@end
