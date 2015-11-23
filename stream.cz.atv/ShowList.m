//
//  ShowList.m
//  stream.cz.atv
//
//  Created by Lukas Jezny on 24/09/15.
//  Copyright © 2015 Lukas Jezny. All rights reserved.
//

#import "ShowList.h"
#import "Show.h"
@implementation ShowList
- (instancetype)initFromDictionary:(NSDictionary*)dict
{
    self = [super initFromDictionary:dict];
    if (self) {
        NSDictionary *embedded = [dict objectForKey:@"_embedded"];
        if(embedded){
            [self.items addObjectsFromArray: [Model convertToModelArray:[embedded objectForKey:@"stream:show"] andItemClass:[Show class]]];
        }
        else{
            return nil;
        }
    }
    return self;
}
@end
