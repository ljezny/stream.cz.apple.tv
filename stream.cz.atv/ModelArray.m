//
//  ModelArray.m
//  stream.cz.atv
//
//  Created by Lukas Jezny on 22/09/15.
//  Copyright © 2015 Lukas Jezny. All rights reserved.
//

#import "ModelArray.h"
#import "Model.h"
@implementation ModelArray

- (instancetype)initWithClass:(Class) itemClass andItems:(NSArray*)items
{
    self = [super init];
    if (self) {
        for (NSDictionary *dict in items) {
            id itemModel =[[itemClass alloc]initFromDictionary:dict];
            [super addObject:itemModel];
            
        }
    }
    return self;
}

@end
