//
//  DataManager.m
//  QuranShortJourney
//
//  Created by Tabish Mufti on 2/2/14.
//  Copyright (c) 2014 Tabish Fayyaz Mufti. All rights reserved.
//

#import "DataManager.h"

@interface DataManager()
{
    NSArray *titlesArray;   //stores all data available in plist file
    NSMutableDictionary *images;
}

- (void)cacheImages;    //cache all images in memory whose info was read from plist file in loadData
- (void)loadData;   //reads data from plist file

@end

@implementation DataManager

#pragma mark - Internal Methods
- (void)cacheImages
{
    if (images == nil)
    {
        images = [[NSMutableDictionary alloc] init];
        for (NSDictionary* item in titlesArray) {
            NSString* imageName = [NSString stringWithFormat:@"%@.jpg", [item objectForKey:@"key"]];
            UIImage* image = [UIImage imageNamed:imageName];
            [images setObject:image forKey:imageName];
        }
    }
}

- (void)loadData
{
    if (titlesArray == nil)
    {
        NSString* plistPath = [[NSBundle mainBundle] pathForResource:@"ThumbnailsData" ofType:@"plist"];
        NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:plistPath];
        titlesArray = [NSArray arrayWithArray:[dict objectForKey:@"titles"]];
    }
    
    [self cacheImages];
}

#pragma mark - Public Interface

static DataManager* dataManager;
+(DataManager*)sharedInstance
{
    if (dataManager == nil)
        dataManager = [[DataManager alloc] init];
    return dataManager;
}

-(NSUInteger)getImagesCount
{
    [self loadData];
    return [titlesArray count];
}

-(NSString*)getKey:(NSUInteger)index
{
    return [[titlesArray objectAtIndex:index] objectForKey:@"key"];
}

-(UIImage*)getImageForKey:(NSString*)key
{
    NSString* imageName = [NSString stringWithFormat:@"%@.jpg", key];
    UIImage* image = [images objectForKey:imageName];
    if (image == nil)   //image was removed from cache?
    {
        UIImage* image = [UIImage imageNamed:imageName];
        [images setObject:image forKey:imageName];
    }
    return image;
}

@end
