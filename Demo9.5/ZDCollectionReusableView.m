//
//  ZDCollectionReusableView.m
//  Demo9.5
//
//  Created by qrh on 2018/9/5.
//  Copyright © 2018年 zdq. All rights reserved.
//

#import "ZDCollectionReusableView.h"
#import "ECCollectionViewLayoutAttributes.h"
@implementation ZDCollectionReusableView
- (id)initWithFrame:(CGRect)frame

{
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        UIImageView *imageView=[[UIImageView alloc] initWithFrame:frame];
        
        imageView.image = [UIImage imageNamed:@"p2526123963.jpg"];
        
        [self addSubview:imageView];
    }
    
    return self;
    
}
@end
