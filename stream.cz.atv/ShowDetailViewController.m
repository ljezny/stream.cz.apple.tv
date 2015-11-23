
//
//  ShowDetailViewController.m
//  stream.cz.atv
//
//  Created by Lukas Jezny on 22/09/15.
//  Copyright © 2015 Lukas Jezny. All rights reserved.
//

#import "ShowDetailViewController.h"
#import "ApiClient.h"
#import "UIImage+Helpers.h"
#import "SeasonCollectionViewController.h"
@interface ShowDetailViewController ()

@end

@implementation ShowDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[ApiClient sharedApiClient] loadModelOnDemand:self.show withCompletionHandler:^(Model * _Nullable root) {
        [self updateUI];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void) updateUI{
    NSNumberFormatter* numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setFormatterBehavior: NSNumberFormatterBehavior10_4];
    [numberFormatter setNumberStyle: NSNumberFormatterDecimalStyle];
    
    self.titleLabel.text = self.show.name;
    self.descriptionLabel.text = self.show.desc;
    self.subscribersCountLabel.text = [numberFormatter stringFromNumber: self.show.favourites];
    self.viewsCountLabel.text = [numberFormatter stringFromNumber: self.show.total_views];
    [UIImage loadFromStreamLink:self.show.image_link callback:^(UIImage *image,NSString *image_link) {
        self.backgroundImageView.image = image;
    }];
    
    [UIImage loadFromStreamLink:self.show.detail_image_link callback:^(UIImage *image,NSString *image_link) {
        self.showLogoImageView.image = image;
    }];
    [self seasonCollectionViewController].seasonList = self.show.seasonList;
}

-(SeasonCollectionViewController*) seasonCollectionViewController{
    return [self.childViewControllers objectAtIndex:0];
}

-(void) setShow:(Show *)show{
    _show = show;
}

@end
