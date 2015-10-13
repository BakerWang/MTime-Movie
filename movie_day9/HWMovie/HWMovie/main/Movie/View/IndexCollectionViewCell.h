//
//  IndexCollectionViewCell.h
//  HWMovie
//
//  Created by gj on 15/7/25.
//  Copyright (c) 2015年 www.huiwen.com 杭州汇文教育. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovieModal.h"


@interface IndexCollectionViewCell : UICollectionViewCell{
    
    UIImageView *_imageView;
    
}
@property(nonatomic,retain)MovieModal *modal;

@end
