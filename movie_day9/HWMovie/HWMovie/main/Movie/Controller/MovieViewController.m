//
//  MovieViewController.m
//  HWMovie
//
//  Created by gj on 15/7/17.
//  Copyright (c) 2015年 www.huiwen.com 杭州汇文教育. All rights reserved.
//

#import "MovieViewController.h"
#import "MovieModal.h"
#import "MovieCell.h"

@interface MovieViewController ()

@end

@implementation MovieViewController

#pragma mark - MainViewController
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"电影";
    }
    return  self;

}

- (void)viewDidLoad {
    [super viewDidLoad];
   // self.view.backgroundColor = [UIColor redColor];
    [self _createNav];
    //第一个子视图  
    [self _createMovieTableView];
    
    [self _createPosterView];
    
    [self _loadData];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//如果是多级控制器关系，这里不被调用
- (UIStatusBarStyle)preferredStatusBarStyle{
    
    return  UIStatusBarStyleDefault;//返回状态栏的样式
}
#pragma mark - LoadData
/**
 {
 "box" : 27361000,
 "new" : true,
 "subject" : {
 "rating" : {
 "stars" : "40",
 "average" : 7.3,
 "min" : 0,
 "max" : 10
 },
 "collect_count" : 49,
 "images" : {
 "small" : "http:\/\/img3.douban.com\/view\/photo\/icon\/public\/p1943399384.jpg",
 "large" : "http:\/\/img3.douban.com\/view\/photo\/photo\/public\/p1943399384.jpg",
 "medium" : "http:\/\/img3.douban.com\/view\/photo\/thumb\/public\/p1943399384.jpg"
 },
 "id" : "3170961",
 "alt" : "http:\/\/movie.douban.com\/subject\/3170961\/",
 "title" : "双枪",
 "subtype" : "movie",
 "year" : "2013",
 "original_title" : "2 Guns"
 },
 "rank" : 1
 },
 */

- (void)_loadData{
    /**
            第三方  官方
            文本，字符串
     *      json---------------------
     
            {}  对应 字典
            []  对应数组
     
            {
                “name”:"guojie",
                "age":19
            }
            [
                "green",
                "yellow"
            ]
     
     
     
            xml----------------------
            <stu>
                <age>19</age>
                <name>guojie<name>
            </stu>
    
     */
    
   // NSJSONSerialization
    //创建数组用于存放modal
    _movieModalArray = [[NSMutableArray alloc] init];
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"us_box.json" ofType:nil];
    //NSData直接存储二进制数据
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    //直接把文件里面的数据 解析放到 数组或者字典
    NSDictionary *dataDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    
   // NSLog(@"%@",dic);
    
    
    NSArray *subjects = [dataDic objectForKey:@"subjects"];

    for (NSDictionary *dic in subjects) {
        NSDictionary *subject = [dic objectForKey:@"subject"];
        MovieModal *modal = [[MovieModal alloc] init];
        modal.title = [subject objectForKey:@"title"];
        modal.year =[subject objectForKey:@"year"];
        modal.images = [subject objectForKey:@"images"];
        NSNumber *number = [[subject objectForKey:@"rating"]objectForKey:@"average"];
        modal.average = [number floatValue];
        //把modal放到数组里面
        [_movieModalArray addObject:modal];
        
    }
    
    _posterView.movieModalArray = _movieModalArray;

    
    //NSJSONSerialization

}




#pragma mark - CreateSubviews－顶部状态栏的切换海报和电影列表的按钮
- (void)_createNav{
    
    UIView *flipView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 30)];
    //btn1 点击进入电影列表页面 默认显示
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn1 setImage:[UIImage imageNamed:@"list_home"] forState:UIControlStateNormal];
    [btn1 setBackgroundImage:[UIImage imageNamed:@"exchange_bg_home"] forState:UIControlStateNormal];
    btn1.tag = 1;
    [btn1 sizeToFit];
    [btn1 addTarget:self action:@selector(flipAction:) forControlEvents:UIControlEventTouchUpInside];
    [flipView addSubview:btn1];
    
    
    //btn2 点击进入海报页面,默认隐藏
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn2 setImage:[UIImage imageNamed:@"poster_home"] forState:UIControlStateNormal];
    [btn2 setBackgroundImage:[UIImage imageNamed:@"exchange_bg_home"] forState:UIControlStateNormal];
    btn2.tag = 2;
    [btn2 sizeToFit];
    [btn2 addTarget:self action:@selector(flipAction:) forControlEvents:UIControlEventTouchUpInside];
    [flipView addSubview:btn2];
    btn2.hidden = YES;
    
    
    /**
        sizeToFit
     *  Resizes the receiver’s frame so that it is the minimum size needed to contain its cell.
        自适应size 能够装下所有子视图
     */
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:flipView];
    self.navigationItem.rightBarButtonItem = item;
    
    
}

//创建海报页面
- (void)_createPosterView{
    
    _posterView = [[PosterView alloc] initWithFrame:self.view.bounds];
   // _posterView.backgroundColor = [UIColor grayColor];
    
    [self.view  addSubview:_posterView];
    
}

//创建电影列表的UITableView
- (void)_createMovieTableView{
    
    _movieTableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    _movieTableView.delegate = self;
    _movieTableView.dataSource = self;
    _movieTableView.hidden = YES;
    [self.view addSubview:_movieTableView];
    
    
    //注册 单元格，用nib，当创建cell对象的时候不是调用alloc创建，会调用awakeFromNib
    UINib *nib = [UINib nibWithNibName:@"MovieCell" bundle:[NSBundle mainBundle]];
    
    [_movieTableView registerNib:nib forCellReuseIdentifier:@"cell"];
    
}

#pragma  mark - Action电影列表和海报页面的相互切换
- (void)flipAction:(UIButton *)button{
    
    UIView *flipView = self.navigationItem.rightBarButtonItem.customView;
    
    UIButton *btn1 = (UIButton *)[flipView viewWithTag:1];
    UIButton *btn2 = (UIButton *)[flipView viewWithTag:2];
    BOOL isLeft = btn2.hidden;
    
    
    [self _flipView:flipView isLeft:isLeft];
    [self _flipView:self.view isLeft:isLeft];
    
    btn1.hidden = !btn1.hidden;
    btn2.hidden = !btn2.hidden;
    _posterView.hidden = !_posterView.hidden;
    _movieTableView.hidden = !_movieTableView.hidden;

}

#pragma mark - Tools－翻转效果
- (void)_flipView:(UIView *)view isLeft:(BOOL)isLeft{
    
    UIViewAnimationOptions option = isLeft?UIViewAnimationOptionTransitionFlipFromLeft:UIViewAnimationOptionTransitionFlipFromRight;
    [UIView transitionWithView:view duration:.3 options:option animations:nil completion:nil];
    
}

#pragma mark - UITableView Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _movieModalArray.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    //只要注册了，这里cell一定不为nil
    MovieCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
   // cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    MovieModal *modal = _movieModalArray[indexPath.row];
  
    cell.modal = modal;
    
    return  cell;

}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 90;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
