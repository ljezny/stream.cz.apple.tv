//
//  SeasonCollectionView.m
//  stream.cz.atv
//
//  Created by Lukas Jezny on 25/09/15.
//  Copyright © 2015 Lukas Jezny. All rights reserved.
//

#import "SeasonCollectionViewController.h"
#import "EpisodeCollectionViewCell.h"
#import "Episode.h"
#import "EpisodeDetailViewController.h"
#import "Season.h"
#import "SeasonSectionHeaderView.h"
#import "ApiClient.h"
@implementation SeasonCollectionViewController

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if(!self.seasonList){
        return 0;
    }
    Season *s = [self.seasonList.items objectAtIndex:section];
    if(!s.fullyLoaded){
        [[ApiClient sharedApiClient] loadModelOnDemand:s withCompletionHandler:^(Model * _Nullable root) {
            [self.collectionView reloadData];
        }];
        return 0;
    }
    return s.episodeList.items.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    EpisodeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"EpisodeCell" forIndexPath:indexPath];
    
    EpisodeList *el =[(Season*)[self.seasonList.items objectAtIndex:indexPath.section] episodeList];
    
    [cell setupForEpisode:[el.items objectAtIndex:indexPath.row]];
    
    if(indexPath.row == el.items.count - 1){
        [el loadNextWithCompletionHandler:^(ModelList * _Nullable list) {
            [collectionView reloadData];
        }];
    }
    
    return cell;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return self.seasonList.items.count;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *reusableview = nil;
    
    if (kind == UICollectionElementKindSectionHeader) {
        SeasonSectionHeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"SeasonHeader" forIndexPath:indexPath];
        headerView.titleLabel.text = [(Season*) [self.seasonList.items objectAtIndex:indexPath.section] name];
        
        reusableview = headerView;
    }
    
    
    return reusableview;
}
-(void) setSeasonList:(SeasonList *)seasonList{
    _seasonList = seasonList;
    [self.collectionView reloadData];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if([segue.identifier compare:@"ShowEpisodeDetail"] == NSOrderedSame){
        NSIndexPath *indexPath = self.collectionView.indexPathsForSelectedItems.lastObject;
        Episode *e = [[(Season*)[self.seasonList.items objectAtIndex:indexPath.section] episodeList].items objectAtIndex:indexPath.row];
        [(EpisodeDetailViewController*) segue.destinationViewController setEpisode:e];
    }
}

@end
