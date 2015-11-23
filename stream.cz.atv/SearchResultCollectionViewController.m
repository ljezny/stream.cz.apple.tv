//
//  SearchResultCollectionViewController.m
//  stream.cz.atv
//
//  Created by Lukas Jezny on 29/09/15.
//  Copyright © 2015 Lukas Jezny. All rights reserved.
//

#import "SearchResultCollectionViewController.h"
#import "EpisodeCollectionViewCell.h"
#import "ShowCollectionViewCell.h"
#import "SearchResultSectionCollectionReusableView.h"
#import "EpisodeDetailViewController.h"
#import "ShowDetailViewController.h"

@interface SearchResultCollectionViewController ()

@end

@implementation SearchResultCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Do any additional setup after loading the view.
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

#pragma mark <UICollectionViewDataSource>

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *reusableview = nil;
    
    if (kind == UICollectionElementKindSectionHeader) {
        SearchResultSectionCollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"SearchResultHeader" forIndexPath:indexPath];
        
        switch (indexPath.section) {
            case 0:
                headerView.self.sectionName.text = @"Pořady";
                break;
            case 1:
                headerView.self.sectionName.text = @"Episody";
                break;
            default:
                break;
        }

        
        reusableview = headerView;
    }
    
    
    return reusableview;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    if(!self.searchResult){
        return 0;
    }
    return 2;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if(!self.searchResult){
        return 0;
    }
    switch (section) {
        case 0:
            return self.searchResult.showList.items.count;
            break;
        case 1:
            return self.searchResult.episodeList.items.count;
            break;
        default:
            break;
    }
    return 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.section) {
        case 0:{
            ShowCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ShowCell" forIndexPath:indexPath];
            [cell setupForShow:[self.searchResult.showList.items objectAtIndex:indexPath.row]];
            return cell;
            }
        case 1:{
            EpisodeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"EpisodeCell" forIndexPath:indexPath];
            [cell setupForEpisode:[self.searchResult.episodeList.items objectAtIndex:indexPath.row]];
            return cell;
        }
        default:
            break;
    }
    
    return nil;
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if([segue.identifier compare:@"ShowEpisodeDetail"] == NSOrderedSame){
        //EpisodeCollectionViewCell *cell = sender;
        Episode *e = [self.searchResult.episodeList.items objectAtIndex:[self.collectionView.indexPathsForSelectedItems.lastObject row]];
        [(EpisodeDetailViewController*) segue.destinationViewController setEpisode:e];
    }
    if([segue.identifier compare:@"ShowShowDetail"] == NSOrderedSame){
        //EpisodeCollectionViewCell *cell = sender;
        Show *s = [self.searchResult.showList.items objectAtIndex:[self.collectionView.indexPathsForSelectedItems.lastObject row]];
        [(ShowDetailViewController*) segue.destinationViewController setShow:s];
    }
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/
-(void) setSearchResult:(SearchResult *)searchResult{
    _searchResult = searchResult;
    [self.collectionView reloadData];
}

@end
