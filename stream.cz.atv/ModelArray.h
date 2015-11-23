//
//  ModelArray.h
//  stream.cz.atv
//
//  Created by Lukas Jezny on 22/09/15.
//  Copyright © 2015 Lukas Jezny. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ModelArray : NSMutableArray
- (instancetype)initWithClass:(Class) itemClass andItems:(NSArray*)items;

@end
