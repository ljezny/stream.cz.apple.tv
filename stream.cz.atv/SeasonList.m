//
//  SeasonList.m
//  stream.cz.atv
//
//  Created by Lukas Jezny on 25/09/15.
//  Copyright © 2015 Lukas Jezny. All rights reserved.
//

#import "SeasonList.h"
#import "Season.h"

@implementation SeasonList
- (instancetype)initFromDictionary:(NSDictionary*)dict
{
    self = [super initFromDictionary:dict];
    if (self) {
        NSDictionary *embedded = [dict objectForKey:@"_embedded"];
        if(embedded){
            [self.items addObjectsFromArray: [Model convertToModelArray:[embedded objectForKey:@"stream:season"] andItemClass:[Season class]]];
        }else{
            return nil;
        }
    }
    return self;
}
@end
