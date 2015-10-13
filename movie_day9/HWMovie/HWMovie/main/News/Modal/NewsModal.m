//
//  NewsModal.m
//  HWMovie
//
//  Created by gj on 15/7/21.
//  Copyright (c) 2015年 www.huiwen.com 杭州汇文教育. All rights reserved.
//

#import "NewsModal.h"

@implementation NewsModal
//处理key跟modal变量名对应不上的情况
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"id"]) {
       self.newsId = [value integerValue];
   }

    
}

@end
