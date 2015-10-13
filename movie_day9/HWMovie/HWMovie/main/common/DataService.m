//
//  DataService.m
//  HWMovie
//
//  Created by gj on 15/7/18.
//  Copyright (c) 2015年 www.huiwen.com 杭州汇文教育. All rights reserved.
//

#import "DataService.h"

@implementation DataService
+ (id) getJsonDataFromFile:(NSString *)fileName{
    
    /*
    //初始化文件路径。
    NSString* path  = [[NSBundle mainBundle] pathForResource:fileName ofType:nil]
     
     //将文件内容读取到字符串中，注意编码NSUTF8StringEncoding 防止乱码，
    NSString* jsonString = [[NSString alloc] initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
     
    //将字符串写到缓冲区。转换成NSData类型，便于json数据解析
    NSData* jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
     
    //解析json数据，使用系统方法 JSONObjectWithData:  options: error:
    id jsonDicOrArray = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:nil];
    */
    NSString *filePath = [[NSBundle mainBundle]pathForResource:fileName ofType:nil];
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    
    id jsonDicOrArray = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    //NSJSONReadingMutableContainers：返回可变容器，NSMutableDictionary或NSMutableArray。
    return jsonDicOrArray;
    
}

@end
