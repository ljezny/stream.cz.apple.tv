//
//  ShowCollectionViewController.m
//  stream.cz.atv
//
//  Created by Lukas Jezny on 22/09/15.
//  Copyright © 2015 Lukas Jezny. All rights reserved.
//

#import "ShowCollectionViewController.h"
#import "ShowCollectionViewCell.h"
#import "Show.h"
#import "ShowDetailViewController.h"
@interface ShowCollectionViewController ()

@end

@implementation ShowCollectionViewController

static NSString * const reuseIdentifier = @"ShowCell";

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


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if(!self.showList){
        return 0;
    }
    return self.showList.items.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ShowCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    [cell setupForShow:[self.showList.items objectAtIndex:indexPath.row]];
    
    if(indexPath.row == self.showList.items.count - 1){
        [self.showList loadNextWithCompletionHandler:^(ModelList * _Nullable list) {
            [collectionView reloadData];
        }];
    }
    
    return cell;
}
-(void) setShowList:(ShowList *)showList{
    _showList = showList;
    
    [self.collectionView reloadData];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if([segue.identifier compare:@"ShowShowDetail"] == NSOrderedSame){
        Show *s = [self.showList.items objectAtIndex:[self.collectionView.indexPathsForSelectedItems.lastObject row]];
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

@end
