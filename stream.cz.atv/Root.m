//
//  Root.m
//  stream.cz.atv
//
//  Created by Lukas Jezny on 22/09/15.
//  Copyright © 2015 Lukas Jezny. All rights reserved.
//

#import "Root.h"

@implementation Root
- (instancetype)initFromDictionary:(NSDictionary*)dict
{
    self = [super initFromDictionary:dict];
    if (self) {
        NSDictionary *embedded = [dict objectForKey:@"_embedded"];
        if(embedded){
            self.tagList = [[TagList alloc] initFromDictionary:[embedded objectForKey:@"stream:taglist"]];
        }
    }
    return self;
}
@end
