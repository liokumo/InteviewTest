//
//  FormTableViewController.h
//  InteviewTest
//
//  Created by Yiyun Liang on 2/9/15.
//  Copyright (c) 2015 Yiyun Liang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FormTableViewController : UITableViewController<UIAlertViewDelegate,UITextFieldDelegate>

@property (nonatomic, strong) NSDateFormatter *dateFormatter;

@property (nonatomic, strong) IBOutlet UITextField *textField;

@property (nonatomic, strong) IBOutlet UISwitch *uiswitch;

@property (nonatomic, strong) IBOutlet UILabel *dateLabel;

@property (nonatomic, strong) IBOutlet UIDatePicker *pickerView;

@property (nonatomic, strong) IBOutlet UIBarButtonItem *doneButton;

@property (strong,nonatomic)NSDictionary * productInfo;

-(IBAction)clickBackground:(id)sender;

@end
