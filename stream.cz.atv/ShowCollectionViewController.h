//
//  ShowCollectionViewController.h
//  stream.cz.atv
//
//  Created by Lukas Jezny on 22/09/15.
//  Copyright © 2015 Lukas Jezny. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShowList.h"
@interface ShowCollectionViewController : UICollectionViewController
@property (nonatomic) ShowList *showList;
@end
