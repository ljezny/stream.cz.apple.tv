//
//  ShowCollectionViewCell.m
//  stream.cz.atv
//
//  Created by Lukas Jezny on 25/09/15.
//  Copyright © 2015 Lukas Jezny. All rights reserved.
//

#import "ShowCollectionViewCell.h"
@implementation ShowCollectionViewCell

-(void) setupForShow:(Show*)show{
    if(self.currentShow != show){
        self.currentShow = show;
        
        self.showTitle.text = show.name;
        self.showImage.image = nil;
        
        [UIImage loadFromStreamLink:show.image_link callback:^(UIImage *image, NSString *stream_link) {
            if([self.currentShow.image_link compare:stream_link] == NSOrderedSame){
                self.showImage.image = image;
            }
        }];
    }
    
}


@end
