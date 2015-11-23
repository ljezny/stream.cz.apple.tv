//
//  FirstViewController.m
//  stream.cz.atv
//
//  Created by Lukas Jezny on 21/09/15.
//  Copyright © 2015 Lukas Jezny. All rights reserved.
//

#import "TabLatestEpisodesViewController.h"
#import <AVKit/AVKit.h>
#import "ApiClient.h"
#import "EpisodeCollectionViewController.h"

@interface TabLatestEpisodesViewController (){
    TagList *tagList;
}

@end

@implementation TabLatestEpisodesViewController{
    NSNumber *currentTag;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    currentTag = [NSNumber numberWithInt:-1];
    
    [self.filterSegmentedControl addTarget:self action:@selector(filterSegmentedControlValueChanged:) forControlEvents: UIControlEventValueChanged];
    [self.filterSegmentedControl removeAllSegments];
    [[ApiClient sharedApiClient] getRootWithCompletionHandler:^(Root * _Nullable root) {
        tagList = root.tagList;
        
        for (Tag *tag in root.tagList.tags) {
            [self.filterSegmentedControl insertSegmentWithTitle:tag.name atIndex:self.filterSegmentedControl.numberOfSegments animated:YES];
        }
    }];
    
    [self loadEpisodesForTag:nil];
}

-(EpisodeCollectionViewController*) episodeCollectionViewController{
    return [self.childViewControllers firstObject];
}

-(void) loadEpisodesForTag:(NSNumber*)tag{
    if(currentTag != tag){
        currentTag = tag;
        [self episodeCollectionViewController].episodeList = nil;
        
        [[ApiClient sharedApiClient] getLatestForTag:tag withCompletionHandler:^(EpisodeList * _Nullable latest) {
            [self episodeCollectionViewController].episodeList = latest;
        }];
    }
}
-(void) filterSegmentedControlValueChanged:(id)sender{
    [self loadEpisodesForTag:[(Tag*)[tagList.tags objectAtIndex:self.filterSegmentedControl.selectedSegmentIndex] value]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    //AVPlayerViewController *avController = segue.destinationViewController;
    //avController.player = [AVPlayer playerWithURL:[NSURL URLWithString:@"https://h01bd.s11.cdn.szn.cz/vod/11/01bd/10009641/mp4/c110277c68197cf4_720p.mp4"]];
    //[avController.player play];
}

@end
