//
//  MainViewController.m
//  stream.cz.atv
//
//  Created by Lukas Jezny on 24/09/15.
//  Copyright © 2015 Lukas Jezny. All rights reserved.
//

#import "MainViewController.h"
#import "UIImage+Helpers.h"
@interface MainViewController (){

}
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    [UIImage purgeImageCache];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
