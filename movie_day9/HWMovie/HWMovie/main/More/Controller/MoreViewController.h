//
//  MoreViewController.h
//  HWMovie
//
//  Created by gj on 15/7/17.
//  Copyright (c) 2015年 www.huiwen.com 杭州汇文教育. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface MoreViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate,UIAlertViewDelegate>{
    
    NSArray *titles;
    NSArray *imageNames;
    UITableView *_tableView;
    
    
}

@end
