//
//  HobbyViewController.h
//  InteviewTest
//
//  Created by Yiyun Liang on 2/9/15.
//  Copyright (c) 2015 Yiyun Liang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HobbyViewController : UIViewController

@property (strong,nonatomic) IBOutlet UIImageView *sampleImage;

@property (strong,nonatomic) IBOutlet UILabel *titleLabel;

@property (strong,nonatomic) NSString * detailLabelText;

@property (strong,nonatomic) NSString * titleLabelText;

@property (strong,nonatomic) NSString * imagePath;

@end
