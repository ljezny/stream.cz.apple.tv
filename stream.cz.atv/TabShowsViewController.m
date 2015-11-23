//
//  SecondViewController.m
//  stream.cz.atv
//
//  Created by Lukas Jezny on 21/09/15.
//  Copyright © 2015 Lukas Jezny. All rights reserved.
//

#import "TabShowsViewController.h"
#import "Show.h"
#import "ApiClient.h"
#import "ShowList.h"
#import "ShowCollectionViewController.h"

@interface TabShowsViewController ()

@end

@implementation TabShowsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[ApiClient sharedApiClient] getShowsWithCompletionHandler:^(ShowList * _Nullable shows) {
        [self showCollectionViewController].showList = shows;
    }];
}
-(ShowCollectionViewController*) showCollectionViewController{
    return [self.childViewControllers objectAtIndex:0];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
