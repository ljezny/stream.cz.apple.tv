//
//  WebImageOperations.h
//  stream.cz.atv
//
//  Created by Lukas Jezny on 22/09/15.
//  Copyright © 2015 Lukas Jezny. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIImage (Helpers)
+(void) purgeImageCache;
+ (void) loadFromStreamLink: (NSString*) stream_link callback:(void (^)(UIImage *image,NSString *stream_link))callback;
+ (void) loadFromURL: (NSURL*) url callback:(void (^)(UIImage *image))callback;

@end