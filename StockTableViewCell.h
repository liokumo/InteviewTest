//
//  StockTableViewCell.h
//  InteviewTest
//
//  Created by Yiyun Liang on 2/9/15.
//  Copyright (c) 2015 Yiyun Liang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StockTableViewCell : UITableViewCell

-(void)getProductNumberLabel:(NSString *) productNumber getProductDescription:(NSString *) productDescription getLocationName:(NSString *) locationName getQuantity:(NSString *) quantity;

@end
