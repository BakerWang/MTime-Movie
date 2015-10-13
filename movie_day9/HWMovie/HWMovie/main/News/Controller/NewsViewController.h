//
//  NewsViewController.h
//  HWMovie
//
//  Created by gj on 15/7/17.
//  Copyright (c) 2015年 www.huiwen.com 杭州汇文教育. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"



@interface NewsViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate>{

    UITableView *_tableView;
    NSMutableArray *_newsModalArray;
    
}
@end