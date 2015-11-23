//
//  Episode.m
//  stream.cz.atv
//
//  Created by Lukas Jezny on 21/09/15.
//  Copyright © 2015 Lukas Jezny. All rights reserved.
//

#import "Episode.h"

#import "VideoQuality.h"
#import "UIImage+Helpers.h"
#import "Season.h"
#import "Show.h"
#import "EpisodeList.h"
@implementation Episode
- (instancetype)initFromDictionary:(NSDictionary*)dict
{
    self = [super initFromDictionary:dict];
    if (self) {
        self.name = [dict objectForKey:@"name"];
        self.imageLink = [dict objectForKey:@"image"];
        self.identifier = [dict objectForKey:@"id"];
        self.views = [dict objectForKey:@"views"];

        self.subtitles = [dict objectForKey:@"subtitles"];
        self.subtitles_srt = [dict objectForKey:@"subtitles_srt"];
        self.published = [dict objectForKey:@"published"];
        self.mregg_before = [dict objectForKey:@"mregg_before"];
        self.mregg_after = [dict objectForKey:@"mregg_after"];
        self.aspect_ratio = [dict objectForKey:@"aspect_ratio"];
        self.order = [dict objectForKey:@"order"];
        self.timeline = [dict objectForKey:@"timeline"];
        self.video_qualities = [Model convertToModelArray:[dict objectForKey:@"video_qualities"] andItemClass:[VideoQuality class]];
        self.canonical = [dict objectForKey:@"canonical"];
        self.detail = [dict objectForKey:@"detail"];
        self.mregg = [Model convertToModelArray:[dict objectForKey:@"mregg"] andItemClass:[MRegg class]];
        
        
        NSDictionary *embedded = [dict objectForKey:@"_embedded"];
        if(embedded){
            self.recommended = [[EpisodeList alloc]initFromDictionary:[embedded objectForKey:@"stream:recommended"]];
            self.show = [[Show alloc]initFromDictionary:[embedded objectForKey:@"stream:show"]];
            self.season = [[Season alloc]initFromDictionary:[embedded objectForKey:@"stream:season"]];
        }
    }
    return self;
}

-(NSString*)perex{
    if(!self.detail){
        return nil;
    }
    NSString *fullperex = [[[NSAttributedString alloc] initWithData:[self.detail dataUsingEncoding:NSUTF8StringEncoding] options:@{NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType, NSCharacterEncodingDocumentAttribute: [NSNumber numberWithInt:NSUTF8StringEncoding]} documentAttributes:nil error:nil] string];
    
    NSArray *lines = [fullperex componentsSeparatedByString:@"\n"];
    if(lines.count > 0){
        return [lines objectAtIndex:0];
    }
    return nil;
}

@end
