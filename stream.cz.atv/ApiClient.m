
//
//  ApiClient.m
//  stream.cz.atv
//
//  Created by Lukas Jezny on 21/09/15.
//  Copyright © 2015 Lukas Jezny. All rights reserved.
//

#import "ApiClient.h"
#import "NSString+MD5.h"
#import "Episode.h"
#import "SearchResult.h"

@implementation ApiClient

#define BASE_URL @"https://api.stream.cz"

+ (id)sharedApiClient {
    static ApiClient *sharedApiClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedApiClient = [[self alloc] init];
    });
    return sharedApiClient;
}

-(NSMutableURLRequest*) createRequest:(NSString*) endPoint{
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",BASE_URL,endPoint]];
    
    int time = round([[NSDate date]timeIntervalSince1970] / 3600.0/ 24.0);
    NSString *apiPassword = [[NSString stringWithFormat:@"%@%@%d",@"fb5f58a820353bd7095de526253c14fd",endPoint,time] MD5];
    
    NSMutableURLRequest *req = [NSMutableURLRequest requestWithURL:url];
    [req addValue:apiPassword forHTTPHeaderField:@"Api-Password"];
    return req;
}

-(void) getPath:(NSString*)path resultModel:(Model*)model withCompletionHandler:(void (^)(Model* __nullable model))completionHandler{
    NSMutableURLRequest *req = [self createRequest:path];
    NSURLSessionDataTask *t = [[NSURLSession sharedSession] dataTaskWithRequest:req completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog([[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding]);
        NSError *jsonError = nil;
        NSDictionary *o = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&jsonError];
        
        id result = [model initFromDictionary:o];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            completionHandler(result);
        });
        
    }];
    [t resume];
}
//
-(void) getPath:(NSString*)path resultModelClass:(Class)class withCompletionHandler:(void (^)(Model* __nullable model))completionHandler{
    [self getPath:path resultModel:[class alloc] withCompletionHandler:completionHandler];
}

-(void) loadModelOnDemand:(Model*)model withCompletionHandler:(void (^)(Model* __nullable root))completionHandler{
    if(!model.selfPath){
        completionHandler(model);
    }
    if(model.fullyLoaded){
        completionHandler(model);
    }
    model.fullyLoaded = YES;
    [self getPath:model.selfPath resultModel:model withCompletionHandler:completionHandler];
}

-(void) loadModelListOnDemand:(Class)modelListClass usingPath:(NSString*)path andCompletionHandler:(void (^)(ModelList* __nullable list))completionHandler{
    if(!path){
        completionHandler(nil);
    }
    [self getPath:path resultModel:[modelListClass alloc] withCompletionHandler:(void (^)(Model* __nullable model))completionHandler];
}
-(void) getMReggLinksForZone:(NSString*)zoneId collocation: (NSString*) collocation section: (NSString*) section options: (NSString*) options WithCompletionHandler:(void (^)(MRegLinks* __nullable links))completionHandler{
    NSString *path = [NSString stringWithFormat:@"/mregg?collocation=%@&section=%@&zone_id=%@&options=%@",collocation,section,zoneId,options];
    
    [self getPath:path resultModelClass:[MRegLinks class] withCompletionHandler:(void (^)(Model* __nullable model))completionHandler];
}
-(void) getRootWithCompletionHandler:(void (^)(Root* __nullable root))completionHandler{
    [self getPath:@"/" resultModelClass:[Root class] withCompletionHandler:(void (^)(Model* __nullable model))completionHandler];
}

-(void) getRandomWithCompletionHandler:(void (^)(EpisodeList* __nullable latest))completionHandler{
    [self getPath:@"/timeline/random?channel_id=0" resultModelClass:[EpisodeList class] withCompletionHandler:(void (^)(Model* __nullable model))completionHandler];
}
-(void) getLatestForTag:(NSNumber*)tag withCompletionHandler:(void (^)(EpisodeList* __nullable latest))completionHandler{
    [self getPath:tag == nil ? @"/timeline/latest":[NSString stringWithFormat:@"/timeline/latest?tag=%d",[tag intValue]] resultModelClass:[EpisodeList class] withCompletionHandler:(void (^)(Model* __nullable model))completionHandler];
}
-(void) getEpisode:(NSNumber*)identifier withCompletionHandler:(void (^)(Episode* __nullable episode))completionHandler{
    [self getPath:[NSString stringWithFormat:@"/episode/%d",[identifier intValue]] resultModelClass:[Episode class] withCompletionHandler:(void (^)(Model* __nullable model))completionHandler];
}

-(void) getShowsWithCompletionHandler:(void (^)(ShowList * _Nullable))completionHandler{
    [self getPath:@"/catalogue" resultModelClass:[ShowList class] withCompletionHandler:(void (^)(Model* __nullable model))completionHandler];
}

///search?channels={channels}&query={query}
-(void) search:(NSString*)query withCompletionHandler:(void (^)(SearchResult* __nullable episode))completionHandler{
    [self getPath:[NSString stringWithFormat:@"/search?channels=0&query=%@",query] resultModelClass:[SearchResult class] withCompletionHandler:(void (^)(Model* __nullable model))completionHandler];
}
@end
