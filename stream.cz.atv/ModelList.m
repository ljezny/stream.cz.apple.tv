//
//  ModelList.m
//  stream.cz.atv
//
//  Created by Lukas Jezny on 28/09/15.
//  Copyright © 2015 Lukas Jezny. All rights reserved.
//

#import "ModelList.h"
#import "ApiClient.h"

@implementation ModelList

- (instancetype)initFromDictionary:(NSDictionary*)dict
{
    self = [super initFromDictionary:dict];
    if (self) {
        self.items = [[NSMutableArray alloc]init];
    }
    return self;
}

-(void) loadNextWithCompletionHandler:(void (^)(ModelList* __nullable list))completionHandler{
    if(self.nextPath){
        [[ApiClient sharedApiClient] loadModelListOnDemand:[self class] usingPath:self.nextPath andCompletionHandler:^(ModelList * _Nullable list) {
            if(list){
                [self.items addObjectsFromArray:list.items];
                self.nextPath = list.nextPath;
                
                completionHandler(list);
            }
        }];
    }
}
-(void) loadPrevWithCompletionHandler:(void (^)(ModelList* __nullable list))completionHandler{
    if(self.prevPath){
        [[ApiClient sharedApiClient] loadModelListOnDemand:[self class] usingPath:self.prevPath andCompletionHandler:^(ModelList * _Nullable list) {
            if(list){
                NSIndexSet *indexes = [NSIndexSet indexSetWithIndexesInRange:
                                        NSMakeRange(0,[list.items count])];
                [self.items insertObjects:list.items atIndexes:indexes];
                self.prevPath = list.prevPath;
                
                completionHandler(list);
            }
        }];
    }
}

@end
