//
//  EpisodeList.m
//  stream.cz.atv
//
//  Created by Lukas Jezny on 22/09/15.
//  Copyright © 2015 Lukas Jezny. All rights reserved.
//

#import "EpisodeList.h"
#import "Episode.h"

@implementation EpisodeList
- (instancetype)initFromDictionary:(NSDictionary*)dict
{
    self = [super initFromDictionary:dict];
    if (self) {
        NSDictionary *embedded = [dict objectForKey:@"_embedded"];
        if(embedded){
            [self.items addObjectsFromArray: [Model convertToModelArray:[embedded objectForKey:@"stream:episode"] andItemClass:[Episode class]]];
        }
        else{
            return nil;
        }
    }
    return self;
}
@end
