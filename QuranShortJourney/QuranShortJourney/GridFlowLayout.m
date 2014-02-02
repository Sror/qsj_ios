//
//  GridFlowLayout.m
//  QuranShortJourney
//
//  Created by Tabish Mufti on 2/2/14.
//  Copyright (c) 2014 Tabish Fayyaz Mufti. All rights reserved.
//

#import "GridFlowLayout.h"

@implementation GridFlowLayout

#define kNumberOfRows 3
#define kColumnSpacing 1
#define kRowSpacing 1

- (void)prepareLayout
{
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    NSLog(@"%f %f", self.collectionView.bounds.size.height, self.collectionView.bounds.size.height/kNumberOfRows);
    //thumb height is equal to total height of view (minus empty spacing) divided over number of rows
    CGFloat thumbHeight = (self.collectionView.bounds.size.height-kNumberOfRows*kRowSpacing)/kNumberOfRows;
    CGFloat thumbWidth = thumbHeight;
    self.itemSize = CGSizeMake(thumbHeight, thumbWidth);
    self.minimumLineSpacing = kColumnSpacing;
    self.minimumInteritemSpacing = kRowSpacing;
    self.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    
    [self.collectionView setShowsHorizontalScrollIndicator:NO];
}

#pragma mark - Overriden methods
//- (NSArray*)layoutAttributesForElementsInRect:(CGRect)rect
//{
//    NSArray* allAttributesInRect = [super layoutAttributesForElementsInRect:rect];
//    
//    for(UICollectionViewLayoutAttributes* attributes in allAttributesInRect)
//    {
//        if (CGRectIntersectsRect(attributes.frame, rect))
//        {
////            attributes.frame = CGRectMake(0, self.itemSize.height*attributes.indexPath.row, self.itemSize.width, self.itemSize.height);
////            NSLog(@"%@", NSStringFromCGRect(attributes.frame));
//        }
//    }
//    
//    return allAttributesInRect;
//}
//
//- (UICollectionViewLayoutAttributes*)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    UICollectionViewLayoutAttributes* cellAttributes = [super layoutAttributesForItemAtIndexPath:indexPath];
//    
//    return cellAttributes;
//}
//
//- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
//{
//    return NO;
//}

@end
