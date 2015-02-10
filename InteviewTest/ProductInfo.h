//
//  ProductInfo.h
//  InteviewTest
//
//  Created by Yiyun Liang on 2/9/15.
//  Copyright (c) 2015 Yiyun Liang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProductInfo : NSObject

@property (nonatomic) int id;
@property (nonatomic, strong) NSString *productNumber;
@property (nonatomic, strong) NSString *productDescription;
@property (nonatomic, strong) NSString *locationName;
@property(nonatomic) int quantity;

@end
