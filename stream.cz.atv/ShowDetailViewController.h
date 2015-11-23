//
//  ShowDetailViewController.h
//  stream.cz.atv
//
//  Created by Lukas Jezny on 22/09/15.
//  Copyright © 2015 Lukas Jezny. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Show.h"

@interface ShowDetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (weak, nonatomic) IBOutlet UIImageView *showLogoImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIView *container;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;

@property (nonatomic) Show *show;
@property (weak, nonatomic) IBOutlet UILabel *subscribersCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *viewsCountLabel;

@end
