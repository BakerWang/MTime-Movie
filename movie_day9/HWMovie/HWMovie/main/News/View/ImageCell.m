//
//  ImageCell.m
//  HWMovie
//
//  Created by gj on 15/7/22.
//  Copyright (c) 2015年 www.huiwen.com 杭州汇文教育. All rights reserved.
//

#import "ImageCell.h"
#import "UIImageView+WebCache.h"
@implementation ImageCell


- (id)initWithFrame:(CGRect)frame{
    
    //  W H  X  Y
    
    self = [super initWithFrame:frame];
    if (self) {
        [self _createSubView];
    }
    return  self;
    
}
- (void)_createSubView{
    _imageView = [[UIImageView alloc] initWithFrame:self.bounds];
    
    _imageView.layer.cornerRadius = 20;
    _imageView.layer.borderWidth = 1;
    _imageView.layer.borderColor = [UIColor whiteColor].CGColor;
    _imageView.layer.masksToBounds = YES;
    [self.contentView addSubview:_imageView];
    

}

- (void)setModal:(ImageModal *)modal{
    
    _modal = modal;
    [self setNeedsLayout];
    
}

- (void)layoutSubviews{
    
    [super layoutSubviews];
    
    //下载图片
    [_imageView sd_setImageWithURL:[NSURL URLWithString:_modal.image]];
    
}



@end
