
//
//  TabSearchViewController.m
//  stream.cz.atv
//
//  Created by Lukas Jezny on 24/09/15.
//  Copyright © 2015 Lukas Jezny. All rights reserved.
//

#import "TabSearchViewController.h"
#import "ApiClient.h"
#import "EpisodeCollectionViewController.h"
#import "UIImage+Helpers.h"
#import "Episode.h"
@interface TabSearchViewController (){
    NSString *currentSearchText;
    NSMutableArray *tiles;
}

@end

@implementation TabSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    /*int MAX_COLUMNS = 5;
    [[ApiClient sharedApiClient] getRandomWithCompletionHandler:^(EpisodeList * _Nullable latest) {
        int cellWidth = self.view.bounds.size.width / MAX_COLUMNS;
        int cellHeight = self.view.bounds.size.height / (latest.items.count / MAX_COLUMNS);
        
        
        for (int i = 0; i<latest.items.count; i++) {
            int x = i % MAX_COLUMNS;
            int y = i / (latest.items.count / MAX_COLUMNS);
            
            UIImageView *iv = [[UIImageView alloc]initWithFrame:CGRectMake(x*cellWidth, y*cellHeight, cellWidth, cellHeight)];
            iv.alpha = 0.4f;
            iv.contentMode = UIViewContentModeScaleAspectFill;
            iv.clipsToBounds = YES;
            //iv.translatesAutoresizingMaskIntoConstraints = false;
            [UIImage loadFromStreamLink:[(Episode*)[latest.items objectAtIndex:i] imageLink] callback:^(UIImage *image, NSString *stream_link) {
                iv.image = image;
            }];
            
            [self.view insertSubview:iv atIndex:0];
        }
    }];*/
}
- (void)updateSearchResultsForSearchController:(UISearchController *)searchController{
    
    if(searchController.searchBar.text && searchController.searchBar.text.length > 0
       ){
        if([searchController.searchBar.text compare:currentSearchText] != NSOrderedSame){
            [(SearchResultCollectionViewController*)searchController.searchResultsController setSearchResult:nil];
            
            currentSearchText = searchController.searchBar.text;
            [[ApiClient sharedApiClient] search:searchController.searchBar.text withCompletionHandler:^(SearchResult * _Nullable searchResult) {
                [(SearchResultCollectionViewController*)searchController.searchResultsController setSearchResult:searchResult];
            }];
        }
        
    }
    
}

-(SearchResultCollectionViewController*) searchResultCollectionViewController{
    return [self.childViewControllers firstObject];
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

- (IBAction)searchTextChanged:(id)sender {
    UITextField *t = (UITextField*)sender;
    if([t.text compare:currentSearchText] != NSOrderedSame){
        [[self searchResultCollectionViewController] setSearchResult:nil];
        
        currentSearchText = t.text;
        [[ApiClient sharedApiClient] search:t.text withCompletionHandler:^(SearchResult * _Nullable searchResult) {
            [[self searchResultCollectionViewController] setSearchResult:searchResult];
        }];
    }
}
@end
