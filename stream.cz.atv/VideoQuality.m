//
//  VideoQuality.m
//  stream.cz.atv
//
//  Created by Lukas Jezny on 23/09/15.
//  Copyright © 2015 Lukas Jezny. All rights reserved.
//

#import "VideoQuality.h"
#import "VideoFormat.h"

@implementation VideoQuality

- (instancetype)initFromDictionary:(NSDictionary*)dict
{
    self = [super initFromDictionary:dict];
    if (self) {
        self.quality_label = [dict objectForKey:@"quality_label"];
        self.formats = [Model convertToModelArray:[dict objectForKey:@"formats"] andItemClass:[VideoFormat class]];        
    }
    return self;
}

@end
