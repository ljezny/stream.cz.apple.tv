//
//  VideoFormat.m
//  stream.cz.atv
//
//  Created by Lukas Jezny on 23/09/15.
//  Copyright © 2015 Lukas Jezny. All rights reserved.
//

#import "VideoFormat.h"

@implementation VideoFormat

- (instancetype)initFromDictionary:(NSDictionary*)dict
{
    self = [super initFromDictionary:dict];
    if (self) {
        self.quality = [dict objectForKey:@"quality"];
        self.type = [dict objectForKey:@"type"];
        self.source = [NSMutableString stringWithString:[dict objectForKey:@"source"]];
    }
    return self;
}

@end
