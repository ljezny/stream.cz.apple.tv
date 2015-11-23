//
//  SearchResult.m
//  stream.cz.atv
//
//  Created by Lukas Jezny on 29/09/15.
//  Copyright © 2015 Lukas Jezny. All rights reserved.
//

#import "SearchResult.h"

@implementation SearchResult
- (instancetype)initFromDictionary:(NSDictionary*)dict
{
    self = [super initFromDictionary:dict];
    if (self) {
        self.showList = [[ShowList alloc]initFromDictionary:dict];
        self.episodeList = [[EpisodeList alloc]initFromDictionary:dict];
        
    }
    return self;
}
@end
