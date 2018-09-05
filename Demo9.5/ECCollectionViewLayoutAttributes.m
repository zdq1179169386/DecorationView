//
//  ECCollectionViewLayoutAttributes.m
//  Demo9.5
//
//  Created by qrh on 2018/9/5.
//  Copyright © 2018年 zdq. All rights reserved.
//

#import "ECCollectionViewLayoutAttributes.h"

@implementation ECCollectionViewLayoutAttributes
+ (UICollectionViewLayoutAttributes *)layoutAttributesForDecorationViewOfKind:(NSString *)decorationViewKind
                                                                withIndexPath:(NSIndexPath *)indexPath {
    
    ECCollectionViewLayoutAttributes *layoutAttributes = [super layoutAttributesForDecorationViewOfKind:decorationViewKind
                                                                                          withIndexPath:indexPath];
    if (indexPath.section%2 == 0) {
        layoutAttributes.color = [UIColor redColor];
    } else {
        layoutAttributes.color = [UIColor blueColor];
    }
    return layoutAttributes;
}
@end
