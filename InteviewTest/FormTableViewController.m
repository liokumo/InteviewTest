//
//  FormTableViewController.m
//  InteviewTest
//
//  Created by Yiyun Liang on 2/9/15.
//  Copyright (c) 2015 Yiyun Liang. All rights reserved.
//

#import "FormTableViewController.h"

static BOOL editingStartTime=false;

@interface FormTableViewController ()

@end

@implementation FormTableViewController

@synthesize pickerView,productInfo;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dateFormatter = [[NSDateFormatter alloc] init];
    
    [self.dateFormatter setDateStyle:NSDateFormatterLongStyle];    
    [self.dateFormatter setTimeStyle:NSDateFormatterNoStyle];
    
    self.dateLabel.text= [self.dateFormatter stringFromDate:[NSDate date]];
    
    pickerView.datePickerMode = UIDatePickerModeDate;
    
    [pickerView addTarget:self action:@selector(dateChanged:) forControlEvents:UIControlEventValueChanged ];
    
//    self.textField=[[UITextField alloc]init];
//    
//    self.textField.backgroundColor = [UIColor clearColor];
//    self.textField.borderStyle = UITextBorderStyleRoundedRect;
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0 && indexPath.row == 2) { // this is my picker cell
        if (editingStartTime) {
            return 162;
            
        } else {
            [self.pickerView setHidden:YES];
            return 0;
        }
    } else {
        return self.tableView.rowHeight;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0 && indexPath.row == 1) { // this is my date cell above the picker cell
        editingStartTime = !editingStartTime;
        
        [self.tableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:2 inSection:0]] withRowAnimation:UITableViewRowAnimationMiddle];
        
        [self.tableView reloadData];
        [self.pickerView setHidden:NO];
    
    }
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void)dateChanged:(id)sender{
    UIDatePicker * control = (UIDatePicker*)sender;
    NSDate* _date = control.date;
   self.dateLabel.text= [self.dateFormatter stringFromDate:_date];
}
- (IBAction)returnBack:(id)sender {
    BOOL reminded = self.uiswitch.on;
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:[@"Name: " stringByAppendingString:self.textField.text]  message:[@"Date: " stringByAppendingFormat:@"%@\nActive Status: %s",self.dateLabel.text,reminded?"YES":"NO"]  delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    
    [alertView show];
    
    
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex

{
    [self.navigationController popViewControllerAnimated:YES];
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

-(IBAction)clickBackground:(id)sender{
    
    
//    int t = self.view.tag;
//    
//    NSLog(@"clickBackground enter t ");
//    
//    if(t ==1001) {
//        
//        NSLog(@"you click background *** ");
//        
//        [[[UIApplication sharedApplication] keyWindow] endEditing:YES];  //这句代码可以 隐藏键盘
//        
//    }
    
    [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
}

@end
