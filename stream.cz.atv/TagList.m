//
//  TagList.m
//  stream.cz.atv
//
//  Created by Lukas Jezny on 22/09/15.
//  Copyright © 2015 Lukas Jezny. All rights reserved.
//

#import "TagList.h"

@implementation TagList
- (instancetype)initFromDictionary:(NSDictionary*)dict
{
    self = [super initFromDictionary:dict];
    if (self) {
        self.tags = [Model convertToModelArray:[dict objectForKey:@"tags"] andItemClass:[Tag class]];
        
        Tag *allTag = [[Tag alloc]init];
        allTag.name = @"Vše";
        [self.tags insertObject:allTag atIndex:0];
    }
    return self;
}
@end
