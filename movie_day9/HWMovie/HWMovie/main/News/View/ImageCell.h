//
//  ImageCell.h
//  HWMovie
//
//  Created by gj on 15/7/22.
//  Copyright (c) 2015年 www.huiwen.com 杭州汇文教育. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImageModal.h"

@interface ImageCell : UICollectionViewCell{
    
    UIImageView *_imageView;
    
}
@property (nonatomic,retain)ImageModal *modal;

@end
