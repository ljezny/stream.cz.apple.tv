//
//  EpisodeDetailViewController.h
//  stream.cz.atv
//
//  Created by Lukas Jezny on 22/09/15.
//  Copyright © 2015 Lukas Jezny. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Episode.h"
@interface EpisodeDetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *playButton;
@property (nonatomic) Episode *episode;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *blurBackgroundImageView;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UIImageView *posterImage;
@property (weak, nonatomic) IBOutlet UIButton *showButton;


@end
