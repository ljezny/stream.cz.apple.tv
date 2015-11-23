//
//  Season.m
//  stream.cz.atv
//
//  Created by Lukas Jezny on 21/09/15.
//  Copyright © 2015 Lukas Jezny. All rights reserved.
//

#import "Season.h"
#import "Episode.h"

@implementation Season
- (instancetype)initFromDictionary:(NSDictionary*)dict
{
    self = [super initFromDictionary:dict];
    if (self) {
        self.name = [dict objectForKey:@"name"];
     
        self.episodeList = [[EpisodeList alloc]initFromDictionary:dict];
        
    }
    return self;
}
@end
