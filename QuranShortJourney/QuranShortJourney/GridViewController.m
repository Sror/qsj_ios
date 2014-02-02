//
//  GridViewController.m
//  QuranShortJourney
//
//  Created by Tabish Mufti on 1/19/14.
//  Copyright (c) 2014 Tabish Fayyaz Mufti. All rights reserved.
//

#import "GridViewController.h"
#import "ThumbnailCell.h"
#import "DataManager.h"

@interface GridViewController ()

@end

@implementation GridViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView*)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [[DataManager sharedInstance] getImagesCount];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ThumbnailCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ThumbnailCell" forIndexPath:indexPath];
    
    NSString* key = [[DataManager sharedInstance] getKey:indexPath.row];    
    NSString* title = NSLocalizedString(key, @"");
    cell.title.text = title;
    cell.thumbnail.image = [[DataManager sharedInstance] getImageForKey:key];
    return cell;
}

@end
