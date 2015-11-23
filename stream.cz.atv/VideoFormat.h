//
//  VideoFormat.h
//  stream.cz.atv
//
//  Created by Lukas Jezny on 23/09/15.
//  Copyright © 2015 Lukas Jezny. All rights reserved.
//

#import "Model.h"

@interface VideoFormat : Model

@property NSString *quality;
@property NSString *type;
@property NSString *source;
@property NSURLComponents *components;
@end
