//
//  PhotoViewController.h
//  HWMovie
//
//  Created by gj on 15/7/23.
//  Copyright (c) 2015年 www.huiwen.com 杭州汇文教育. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PhotoCollectionView.h"

@interface PhotoViewController : UIViewController{
    PhotoCollectionView  *_collectionView;
}
@property (nonatomic,retain)NSArray *imageUrlArray;
@property (nonatomic,assign)NSInteger currentIndex;//当前点击的图片的索引

@end
