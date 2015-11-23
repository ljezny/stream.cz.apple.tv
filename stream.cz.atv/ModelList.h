//
//  ModelList.h
//  stream.cz.atv
//
//  Created by Lukas Jezny on 28/09/15.
//  Copyright © 2015 Lukas Jezny. All rights reserved.
//

#import "Model.h"


@interface ModelList : Model

@property NSMutableArray *items;

-(void) loadNextWithCompletionHandler:(void (^)(ModelList* __nullable list))completionHandler;
-(void) loadPrevWithCompletionHandler:(void (^)(ModelList* __nullable list))completionHandler;



@end
