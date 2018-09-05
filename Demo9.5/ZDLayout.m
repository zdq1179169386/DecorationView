//
//  ZDLayout.m
//  Demo9.5
//
//  Created by qrh on 2018/9/5.
//  Copyright © 2018年 zdq. All rights reserved.
//

#import "ZDLayout.h"
#import "ZDCollectionReusableView.h"
@implementation ZDLayout

-(void)prepareLayout{
    
    [super prepareLayout];
    [self  registerClass:[ZDCollectionReusableView  class] forDecorationViewOfKind:@"CDV"];//注册Decoration View
}

-(CGSize)collectionViewContentSize{
    
    return  self.collectionView.frame.size;
    
}



- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)path

{
    UICollectionViewLayoutAttributes* attributes =     [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:path];
    
    attributes.size = CGSizeMake(215/3.0, 303/3.0);
    
    
    attributes.center=CGPointMake(80*(path.item+1), 62.5+125*path.section);
    
    return attributes;
    
}

//Decoration View的布局。
- (UICollectionViewLayoutAttributes *)layoutAttributesForDecorationViewOfKind:(NSString*)decorationViewKind atIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewLayoutAttributes* att = [UICollectionViewLayoutAttributes layoutAttributesForDecorationViewOfKind:decorationViewKind withIndexPath:indexPath];
    att.frame=CGRectMake(0, (125*indexPath.section)/2.0, 320, 125);
    att.zIndex=-1;
    return att;
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect{
    NSMutableArray* attributes = [NSMutableArray array];
    //把Decoration View的布局加入可见区域布局。
    for (int y=0; y<3; y++) {
        NSIndexPath* indexPath = [NSIndexPath indexPathForItem:3 inSection:y];
        [attributes addObject:[self layoutAttributesForDecorationViewOfKind:@"CDV"atIndexPath:indexPath]];
    }
    for (NSInteger i=0 ; i < 3; i++) {
        for (NSInteger t=0; t<3; t++) {
            NSIndexPath* indexPath = [NSIndexPath indexPathForItem:t inSection:i];
            [attributes addObject:[self layoutAttributesForItemAtIndexPath:indexPath]];
        }
    }
    return attributes;
}



@end
