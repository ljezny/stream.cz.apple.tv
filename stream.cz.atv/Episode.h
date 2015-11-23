//
//  Episode.h
//  stream.cz.atv
//
//  Created by Lukas Jezny on 21/09/15.
//  Copyright © 2015 Lukas Jezny. All rights reserved.
//

#import "Model.h"
#import "MRegg.h"
@class Show;
@class Season;
@class EpisodeList;

@interface Episode : Model

@property NSNumber *identifier;
@property NSString* name;
@property (nonatomic) NSString* imageLink;

@property NSNumber* views;
@property NSString* subtitles;
@property NSString* subtitles_srt;
@property NSNumber* published;
@property NSNumber* mregg_before;
@property NSNumber* mregg_after;
@property NSNumber* aspect_ratio;
@property NSNumber* order;
@property NSNumber* timeline;
@property NSArray* video_qualities;
@property NSNumber* canonical;
@property NSString* detail;

@property EpisodeList* recommended;
@property Show* show;
@property Season *season;
@property NSArray *mregg;

-(NSString*) perex;

@end
