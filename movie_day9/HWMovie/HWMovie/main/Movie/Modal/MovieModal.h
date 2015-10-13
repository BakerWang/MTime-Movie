//
//  MovieModal.h
//  HWMovie
//
//  Created by gj on 15/7/20.
//  Copyright (c) 2015年 www.huiwen.com 杭州汇文教育. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MovieModal : NSObject

@property (nonatomic,copy) NSString *year;
@property (nonatomic,copy) NSString *title;
@property (nonatomic,retain) NSDictionary * images;
@property (nonatomic,assign) float average;

@end
