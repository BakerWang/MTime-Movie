//
//  DataService.h
//  HWMovie
//
//  Created by gj on 15/7/18.
//  Copyright (c) 2015年 www.huiwen.com 杭州汇文教育. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataService : NSObject

+ (id) getJsonDataFromFile:(NSString *)fileName;

@end
