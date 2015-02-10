//
//  StockTableViewController.h
//  InteviewTest
//
//  Created by Yiyun Liang on 2/9/15.
//  Copyright (c) 2015 Yiyun Liang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StockTableViewController : UITableViewController<UIAlertViewDelegate>{
    
    UIAlertView *remoteAlertView;
    NSArray * stockList;
    NSDictionary * storeList;
    NSArray * warehouseList;
    
}

@property (strong,nonatomic) NSMutableArray *list;

@property (strong,nonatomic)NSDictionary * productList;

@property (strong,nonatomic)NSDictionary * productInfo;

@end
