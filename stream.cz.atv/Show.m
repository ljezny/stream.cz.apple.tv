//
//  Show.m
//  stream.cz.atv
//
//  Created by Lukas Jezny on 21/09/15.
//  Copyright © 2015 Lukas Jezny. All rights reserved.
//

#import "Show.h"
#import "SeasonList.h"
#import "Season.h"
@implementation Show
- (instancetype)initFromDictionary:(NSDictionary*)dict
{
    self = [super initFromDictionary:dict];
    if (self) {
        self.name = [dict objectForKey:@"name"];
        self.image_link = [dict objectForKey:@"image"];
        self.tag = [dict objectForKey:@"tag"];
        
        self.total_views = [dict objectForKey:@"total_views"];
        self.shop_link = [dict objectForKey:@"shop_link"];
        self.detail = [dict objectForKey:@"detail"];
        self.play_direction = [dict objectForKey:@"play_direction"];
        self.poster_image_link = [dict objectForKey:@"poster_image"];
        self.detail_image_link = [dict objectForKey:@"detail_image"];
        self.favourites = [dict objectForKey:@"favourites"];
        self.channel = [dict objectForKey:@"channel"];
        self.desc = [dict objectForKey:@"description"];
        
        self.seasonList = [[SeasonList alloc]initFromDictionary:dict];

    }
    return self;
}

@end
