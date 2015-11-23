//
//  ShowCollectionViewCell.h
//  stream.cz.atv
//
//  Created by Lukas Jezny on 25/09/15.
//  Copyright © 2015 Lukas Jezny. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Show.h"

@interface ShowCollectionViewCell : UICollectionViewCell

@property Show *currentShow;
@property (weak, nonatomic) IBOutlet UIImageView *showImage;
@property (weak, nonatomic) IBOutlet UILabel *showTitle;
-(void) setupForShow:(Show*)show;
@end
