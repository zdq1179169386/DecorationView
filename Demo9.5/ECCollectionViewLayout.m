//
//  ECCollectionViewLayout.m
//  Demo9.5
//
//  Created by qrh on 2018/9/5.
//  Copyright © 2018年 zdq. All rights reserved.
//

#import "ECCollectionViewLayout.h"
#import "ECCollectionViewLayoutAttributes.h"
#import "ECCollectionReusableView.h"

static NSString * kDecorationReuseIdentifier = @"id";
@implementation ECCollectionViewLayout



+ (Class)layoutAttributesClass
{
    return [ECCollectionViewLayoutAttributes class];
}

- (void)prepareLayout {
    [super prepareLayout];
    
    self.minimumLineSpacing = 8.0f;
    self.minimumInteritemSpacing = 0.0f;
    self.sectionInset = UIEdgeInsetsMake(8, 8, 8, 8);
//    self.sectionInset = UIEdgeInsetsZero;
   CGFloat w = [UIScreen mainScreen].bounds.size.width;
    self.itemSize = CGSizeMake((w - 24) / 2.0, 115.0f);
    
    [self registerClass:[ECCollectionReusableView class] forDecorationViewOfKind:kDecorationReuseIdentifier];
}
- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect {
    NSArray *attributes = [super layoutAttributesForElementsInRect:rect];
    
    NSMutableArray *allAttributes = [NSMutableArray arrayWithArray:attributes];
    for (UICollectionViewLayoutAttributes *attribute in attributes) {
        // 查找一行的第一个item
        if (attribute.representedElementKind == UICollectionElementCategoryCell
            && attribute.frame.origin.x == self.sectionInset.left) {
            // 创建decoration属性、
            ECCollectionViewLayoutAttributes *decorationAttributes =
            [ECCollectionViewLayoutAttributes layoutAttributesForDecorationViewOfKind:kDecorationReuseIdentifier
                                                                        withIndexPath:attribute.indexPath];
            // 让decoration view占据整行
            CGFloat Y = attribute.frame.origin.y-(self.sectionInset.top) ;
            decorationAttributes.frame =
            CGRectMake(0,
                       Y,
                       self.collectionViewContentSize.width,
                       self.itemSize.height+(self.minimumLineSpacing+self.sectionInset.top * 0.5+self.sectionInset.bottom * 0.5));
            // 设置zIndex，表示在item的后面
            decorationAttributes.zIndex = attribute.zIndex-1;
            // 添加属性到集合
            [allAttributes addObject:decorationAttributes];
        }
        
    }
    
    return allAttributes;
}

@end
