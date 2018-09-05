//
//  ECCollectionReusableView.m
//  Demo9.5
//
//  Created by qrh on 2018/9/6.
//  Copyright © 2018年 zdq. All rights reserved.
//

#import "ECCollectionReusableView.h"
#import "ECCollectionViewLayoutAttributes.h"

@implementation ECCollectionReusableView
- (void)applyLayoutAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes {
    [super applyLayoutAttributes:layoutAttributes];
    //设置背景颜色
    ECCollectionViewLayoutAttributes *ecLayoutAttributes = (ECCollectionViewLayoutAttributes*)layoutAttributes;
    self.backgroundColor = ecLayoutAttributes.color;
}

@end
