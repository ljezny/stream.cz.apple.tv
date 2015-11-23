//
//  ApiClient.h
//  stream.cz.atv
//
//  Created by Lukas Jezny on 21/09/15.
//  Copyright © 2015 Lukas Jezny. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Root.h"
#import "EpisodeList.h"
#import "ShowList.h"
#import "ModelList.h"
#import "SearchResult.h"
#import "MRegLinks.h"
@class Episode;

@interface ApiClient : NSObject

+ (id)sharedApiClient;

-(void) loadModelOnDemand:(Model*)model withCompletionHandler:(void (^)(Model* __nullable root))completionHandler;
-(void) loadModelListOnDemand:(Class)modelListClass usingPath:(NSString*)path andCompletionHandler:(void (^)(ModelList* __nullable list))completionHandler;


-(void) getMReggLinksForZone:(NSString*)zoneId collocation: (NSString*) collocation section: (NSString*) section options: (NSString*) options WithCompletionHandler:(void (^)(MRegLinks* __nullable links))completionHandler;
-(void) getRootWithCompletionHandler:(void (^)(Root* __nullable root))completionHandler;
-(void) getRandomWithCompletionHandler:(void (^)(EpisodeList* __nullable latest))completionHandler;
-(void) getLatestForTag:(NSNumber*)tag withCompletionHandler:(void (^)(EpisodeList* __nullable latest))completionHandler;
-(void) getShowsWithCompletionHandler:(void (^)(ShowList
                                                * __nullable latest))completionHandler;
-(void) getEpisode:(NSNumber*)identifier withCompletionHandler:(void (^)(Episode* __nullable episode))completionHandler;
-(void) search:(NSString*)query withCompletionHandler:(void (^)(SearchResult* __nullable episode))completionHandler;


@end
