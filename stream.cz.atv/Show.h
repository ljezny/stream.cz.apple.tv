//
//  Show.h
//  stream.cz.atv
//
//  Created by Lukas Jezny on 21/09/15.
//  Copyright © 2015 Lukas Jezny. All rights reserved.
//

#import "Model.h"
#import "UIImage+Helpers.h"
#import "SeasonList.h"

@interface Show : Model

@property NSString *name;
@property (nonatomic) NSString *image_link;
@property NSNumber *tag;

@property NSNumber *total_views;
@property NSString *shop_link;
@property NSString *detail;
@property NSString *play_direction;
@property NSString *poster_image_link;
@property NSString *detail_image_link;
@property NSNumber *favourites;
@property NSNumber *channel;
@property NSString *desc;

@property SeasonList *seasonList;

@end