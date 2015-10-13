//
//  CinemaViewController.h
//  HWMovie
//
//  Created by gj on 15/7/17.
//  Copyright (c) 2015年 www.huiwen.com 杭州汇文教育. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
@interface CinemaViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate>{
    
    UITableView *_tableView;
    
    //结构
    /*
     [
     {"name" : "东城区","id" : "1029"},
     {"name" : "东城区","id" : "1029"}
     ...
     ]
     */
    NSArray *_districtArray;
    
    //结构
    /*
     {
     "1029":[
     影院Model1,
     影院Model2,
     ]
     }
     */
    NSMutableDictionary *_cinemaDictionary;
    
    
    //存储每一个组的是否收起的状态
    /*
     [NO,NO,NO]   //NO:收起  YES：展开
     */
    BOOL close[30];
    
}

@end
