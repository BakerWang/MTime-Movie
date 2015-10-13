//
//  MovieViewController.h
//  HWMovie
//
//  Created by gj on 15/7/17.
//  Copyright (c) 2015年 www.huiwen.com 杭州汇文教育. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "PosterView.h"

@interface MovieViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate>{
    
    UITableView *_movieTableView;//电影列表页面
    PosterView *_posterView;//海报页面
    NSMutableArray *_movieModalArray;//用来存放modal对象
    
}

@end
