//
//  SearchResult.h
//  stream.cz.atv
//
//  Created by Lukas Jezny on 29/09/15.
//  Copyright © 2015 Lukas Jezny. All rights reserved.
//

#import "Model.h"

#import "ShowList.h"
#import "EpisodeList.h"

@interface SearchResult : Model

@property ShowList *showList;
@property EpisodeList *episodeList;

@end
