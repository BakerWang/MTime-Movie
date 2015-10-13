//
//  PhotoScrollView.h
//  HWMovie
//
//  Created by gj on 15/7/23.
//  Copyright (c) 2015年 www.huiwen.com 杭州汇文教育. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoScrollView : UIScrollView<UIScrollViewDelegate>{
    
    UIImageView *_imageView;
    
}
@property (nonatomic,copy) NSString *imageUrlStr;

@end
