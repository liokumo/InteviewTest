//
//  HobbyViewController.m
//  InteviewTest
//
//  Created by Yiyun Liang on 2/9/15.
//  Copyright (c) 2015 Yiyun Liang. All rights reserved.
//

#import "HobbyViewController.h"
#define LABEL_WIDTH [UIScreen mainScreen].bounds.size.width/3+20

@interface HobbyViewController ()

@end

@implementation HobbyViewController
@synthesize titleLabel,sampleImage,detailLabelText,imagePath,titleLabelText;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    titleLabel.text=titleLabelText;
    [sampleImage setImage:[UIImage imageNamed:imagePath]];
    
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(180, 120, LABEL_WIDTH, 20)];
    label.font = [UIFont boldSystemFontOfSize:15.0f];
    label.numberOfLines = 0;
    label.textColor = [UIColor blackColor];
    label.textAlignment = NSTextAlignmentJustified;
    
    NSString *str = detailLabelText;
    
    NSDictionary *attribute = @{NSFontAttributeName: label.font};
    
    CGSize size = [str boundingRectWithSize:CGSizeMake(label.frame.size.width, MAXFLOAT) options: NSStringDrawingUsesLineFragmentOrigin attributes:attribute context:nil].size;
    
    
    
    [label setFrame:CGRectMake(180, 120, LABEL_WIDTH, size.height)];
    label.text = str;
    
    [self.view addSubview:label];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
