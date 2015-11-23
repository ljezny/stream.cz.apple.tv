//
//  SeasonCollectionView.h
//  stream.cz.atv
//
//  Created by Lukas Jezny on 25/09/15.
//  Copyright © 2015 Lukas Jezny. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SeasonList.h"
@interface SeasonCollectionViewController : UICollectionViewController
@property (nonatomic) SeasonList *seasonList;
@end
