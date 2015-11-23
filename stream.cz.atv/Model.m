//
//  Model.m
//  stream.cz.atv
//
//  Created by Lukas Jezny on 21/09/15.
//  Copyright © 2015 Lukas Jezny. All rights reserved.
//

#import "Model.h"

@implementation Model
- (instancetype)initFromDictionary:(NSDictionary*)dict
{
    self = [super init];
    if (self) {
        if(!dict){
            return nil;
        }
        self.selfPath = [[[dict objectForKey:@"_links"] objectForKey:@"self"] objectForKey:@"href"];
        self.nextPath = [[[dict objectForKey:@"_links"] objectForKey:@"next"] objectForKey:@"href"];
        self.prevPath = [[[dict objectForKey:@"_links"] objectForKey:@"prev"] objectForKey:@"href"];
    }
    return self;
}

+ (NSMutableArray*) convertToModelArray:(NSArray*)items andItemClass:(Class)itemClass{
    if(!items){
        return nil;
    }
    
    if([items isKindOfClass:[NSDictionary class]]){
        return [NSArray arrayWithObject:[[itemClass alloc]initFromDictionary:items]];
    }
    
    NSMutableArray *array = [[NSMutableArray alloc]init];
    for (NSDictionary *dict in items) {
        id itemModel =[[itemClass alloc]initFromDictionary:dict];
        [array addObject:itemModel];
        
    }
    return array;
}

@end
