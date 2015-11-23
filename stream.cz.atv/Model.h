//
//  Model.h
//  stream.cz.atv
//
//  Created by Lukas Jezny on 21/09/15.
//  Copyright © 2015 Lukas Jezny. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model : NSObject

@property NSString* selfPath;
@property NSString* nextPath;
@property NSString* prevPath;
@property BOOL fullyLoaded;

- (instancetype)initFromDictionary:(NSDictionary*)dict;
+ (NSMutableArray*) convertToModelArray:(NSDictionary*)dict andItemClass:(Class)itemClass;

@end
