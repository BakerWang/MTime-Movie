//
//  MovieCell.h
//  HWMovie
//
//  Created by gj on 15/7/20.
//  Copyright (c) 2015年 www.huiwen.com 杭州汇文教育. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovieModal.h"
#import "StarView.h"

@interface MovieCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;

@property (weak, nonatomic) IBOutlet UILabel *titleLable;

@property (weak, nonatomic) IBOutlet UILabel *yearLable;

@property (weak, nonatomic) IBOutlet UILabel *averageLable;

@property (weak, nonatomic) IBOutlet StarView *starView;

@property (nonatomic,retain) MovieModal *modal;

@end
