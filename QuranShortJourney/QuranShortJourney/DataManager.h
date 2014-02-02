//
//  DataManager.h
//  QuranShortJourney
//
//  Created by Tabish Mufti on 2/2/14.
//  Copyright (c) 2014 Tabish Fayyaz Mufti. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * Responsible for interfacing with app data (images, plist file) and maitaining images cache
 */
@interface DataManager : NSObject

+(DataManager*)sharedInstance;  //returns a shared singleton instance of the class
-(UIImage*)getImageForKey:(NSString*)key;   //returns image against a key
-(NSString*)getKey:(NSUInteger)index;   //returns the key against an index
-(NSUInteger)getImagesCount;    //returns the total number of images to display in grid
@end
