//
//  WebImageOperations.m
//  stream.cz.atv
//
//  Created by Lukas Jezny on 22/09/15.
//  Copyright © 2015 Lukas Jezny. All rights reserved.
//

#import "UIImage+Helpers.h"

@implementation UIImage (Helpers)

NSMutableDictionary *cache;
+(void) purgeImageCache{
    cache = [[NSMutableDictionary alloc]init];
}
+ (void) loadFromStreamLink: (NSString*) stream_link callback:(void (^)(UIImage *image,NSString *stream_link))callback{
    if(!cache){
        cache = [[NSMutableDictionary alloc]init];
    }
    NSString* url = [stream_link stringByReplacingOccurrencesOfString:@"/{width}/{height}" withString:[NSString stringWithFormat:@""]];
    url = [NSString stringWithFormat:@"https:%@",url];
    
    UIImage *cachedImage = [cache objectForKey:stream_link];
    if(cachedImage){
        callback(cachedImage,stream_link);
        return;
    }
    
    if([cache allKeys].count > 200){
        [cache removeObjectForKey:[[cache allKeys] firstObject]];
    }
    
    [self loadFromURL:[NSURL URLWithString:url] callback:^(UIImage *image) {
        [cache setValue:image forKey:stream_link];
        callback(image,stream_link);
        
    }];
}

+ (void) loadFromURL: (NSURL*) url callback:(void (^)(UIImage *image))callback {
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0ul);
    dispatch_async(queue, ^{
        NSData * imageData = [NSData dataWithContentsOfURL:url];
        dispatch_async(dispatch_get_main_queue(), ^{
            UIImage *image = [UIImage imageWithData:imageData];
            callback(image);
        });
    });
}

@end
