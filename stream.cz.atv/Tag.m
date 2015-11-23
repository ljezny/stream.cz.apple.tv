//
//  Tag.m
//  stream.cz.atv
//
//  Created by Lukas Jezny on 22/09/15.
//  Copyright © 2015 Lukas Jezny. All rights reserved.
//

#import "Tag.h"

@implementation Tag
- (instancetype)initFromDictionary:(NSDictionary*)dict
{
    self = [super initFromDictionary:dict];
    if (self) {
        self.name = [dict objectForKey:@"name"];
        self.value = [dict objectForKey:@"filter_value"];
    }
    return self;
}
@end
