//
//  EpisodeCollectionViewController.m
//  stream.cz.atv
//
//  Created by Lukas Jezny on 22/09/15.
//  Copyright © 2015 Lukas Jezny. All rights reserved.
//

#import "EpisodeCollectionViewController.h"
#import "EpisodeCollectionViewCell.h"
#import "EpisodeDetailViewController.h"

@interface EpisodeCollectionViewController ()

@end

@implementation EpisodeCollectionViewController

static NSString * const reuseIdentifier = @"EpisodeCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    self.clearsSelectionOnViewWillAppear = NO;
    
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

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if(self.episodeList.items == nil){
        return 0;
    }
    return self.episodeList.items.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    EpisodeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    [cell setupForEpisode:[self.episodeList.items objectAtIndex:indexPath.row]];
    
    if(indexPath.row == self.episodeList.items.count - 1){
        [self.episodeList loadNextWithCompletionHandler:^(ModelList * _Nullable list) {
            [collectionView reloadData];
        }];
    }
    
    return cell;
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
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if([segue.identifier compare:@"ShowEpisodeDetail"] == NSOrderedSame){
        //EpisodeCollectionViewCell *cell = sender;
        Episode *e = [self.episodeList.items objectAtIndex:[self.collectionView.indexPathsForSelectedItems.lastObject row]];
        [(EpisodeDetailViewController*) segue.destinationViewController setEpisode:e];
    }
}
-(void) setEpisodeList:(EpisodeList *)episodeList{
    _episodeList = episodeList;
    [self.collectionView reloadData];
}


@end
