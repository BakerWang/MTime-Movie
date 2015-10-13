//
//  PhotoCollectionViewCell.m
//  HWMovie
//
//  Created by gj on 15/7/23.
//  Copyright (c) 2015年 www.huiwen.com 杭州汇文教育. All rights reserved.
//

#import "PhotoCollectionViewCell.h"
//修改cell
@implementation PhotoCollectionViewCell

- (id)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        _scrollView = [[PhotoScrollView alloc] initWithFrame:self.bounds];
        _scrollView.tag = 100;
        [self.contentView addSubview:_scrollView];
        self.backgroundColor = [UIColor yellowColor];
       // _scrollView.imageUrlStr = self.imageUrlStr;
    }
    return  self;
    
}

- (void)setImageUrlStr:(NSString *)imageUrlStr{
    
    _imageUrlStr = imageUrlStr;
    _scrollView.imageUrlStr = imageUrlStr;
    
}



@end
