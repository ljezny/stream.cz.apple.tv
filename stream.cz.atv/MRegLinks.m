//
//  MRegLinks.m
//  stream.cz.atv
//
//  Created by Lukas Jezny on 30/10/15.
//  Copyright © 2015 Lukas Jezny. All rights reserved.
//

#import "MRegLinks.h"
#import "VideoFormat.h"
#import "VideoQuality.h"
@implementation MRegLinks

- (instancetype)initFromDictionary:(NSDictionary*)dict
{
    self = [super initFromDictionary:dict];
    if (self) {
           self.video_qualities = [Model convertToModelArray:[dict objectForKey:@"video_qualities"] andItemClass:[VideoQuality class]];
    }
    return self;
}


@end
