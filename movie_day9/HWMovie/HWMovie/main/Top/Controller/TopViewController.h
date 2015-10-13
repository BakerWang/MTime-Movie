//
//  TopViewController.h
//  HWMovie
//
//  Created by gj on 15/7/21.
//  Copyright (c) 2015年 www.huiwen.com 杭州汇文教育. All rights reserved.
//

#import "BaseViewController.h"

@interface TopViewController : BaseViewController<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>{
    
    UICollectionView *_collectionView;
    NSMutableArray *_movieModalArray;
    
}




@end
