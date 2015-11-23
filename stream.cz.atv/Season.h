//
//  Season.h
//  stream.cz.atv
//
//  Created by Lukas Jezny on 21/09/15.
//  Copyright © 2015 Lukas Jezny. All rights reserved.
//

#import "Model.h"
#import "EpisodeList.h"

@class Episode;

@interface Season : Model
@property NSString *name;
@property EpisodeList *episodeList;
@end
