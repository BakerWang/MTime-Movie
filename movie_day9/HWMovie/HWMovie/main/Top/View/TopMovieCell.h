//
//  TopMovieCell.h
//  HWMovie
//
//  Created by gj on 15/7/19.
//  Copyright (c) 2015年 www.huiwen.com 杭州汇文教育. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StarView.h"
#import "MovieModal.h"


@interface TopMovieCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLable;
@property (weak, nonatomic) IBOutlet StarView *starView;
@property (weak, nonatomic) IBOutlet UILabel *averageLable;

@property (nonatomic,assign) MovieModal *modal;//数据源

@end
