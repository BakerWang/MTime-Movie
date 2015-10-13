//
//  NewImageListViewController.h
//  HWMovie
//
//  Created by gj on 15/7/22.
//  Copyright (c) 2015年 www.huiwen.com 杭州汇文教育. All rights reserved.
//

#import "BaseViewController.h"

@interface NewImageListViewController : BaseViewController<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>{
    
    UICollectionView *_collectionView;
    NSMutableArray *_imageModalArray;
    
    
}

@end
