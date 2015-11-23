//
//  MRegg.m
//  stream.cz.atv
//
//  Created by Lukas Jezny on 23/09/15.
//  Copyright © 2015 Lukas Jezny. All rights reserved.
//

#import "MRegg.h"

@implementation MRegg
- (instancetype)initFromDictionary:(NSDictionary*)dict
{
    self = [super initFromDictionary:dict];
    if (self) {
        self.zone_id = [dict objectForKey:@"zone_id"];
        self.section = [dict objectForKey:@"section"];
        self.aspect_ratio = [dict objectForKey:@"aspect_ratio"];
        self.skippable_after = [dict objectForKey:@"skippable_after"];
        self.collocation = [dict objectForKey:@"collocation"];
        self.position = [dict objectForKey:@"position"];
        self.options = [dict objectForKey:@"options"];
    }
    return self;
}
@end
