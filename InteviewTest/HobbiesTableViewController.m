//
//  HobbiesTableViewController.m
//  InteviewTest
//
//  Created by Yiyun Liang on 2/9/15.
//  Copyright (c) 2015 Yiyun Liang. All rights reserved.
//

#import "HobbiesTableViewController.h"
#import "HobbyViewController.h"

@interface HobbiesTableViewController ()

@end

@implementation HobbiesTableViewController

@synthesize messages;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSMutableArray *list = [NSMutableArray arrayWithObjects:@"Reading Novels",@"Listening Music", nil];
    self.messages = list;
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    //self.hidesBottomBarWhenPushed=YES;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [self.messages count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellWithIdentifier = @"hobbydetail";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellWithIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellWithIdentifier];
    }
    NSUInteger row = [indexPath row];
    cell.textLabel.text = [self.messages objectAtIndex:row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}


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

//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//
//{
//    
//    NSString *titileString = [self.messages objectAtIndex:[indexPath row]];  //这个表示选中的那个cell上的数据
//    
////    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示"message:titileString delegate:self cancelButtonTitle:@"OK"otherButtonTitles:nil];
////    
////    [alert show];
//
//    HobbyViewController *hobbyViewController=[[HobbyViewController alloc]init];
//    hobbyViewController.title=titileString;
//    [[self navigationController] pushViewController:hobbyViewController animated:YES];
//    
//}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"Detail"]) {
        UITableViewCell * cell=sender;
        HobbyViewController *tovc = segue.destinationViewController;
        if([cell.textLabel.text isEqualToString:@"Reading Novels"]){
            tovc.imagePath=@"read.gif";
            tovc.titleLabelText=cell.textLabel.text;
            tovc.detailLabelText=@"Love reading novels, the fantasy, the dream always give me brave and power.";
        }
        else{
            tovc.imagePath=@"music2.png";
            tovc.titleLabelText=cell.textLabel.text;
            tovc.detailLabelText=@"Love rock and pop music, which can certainly make me swing by!";
        }
    }
}


@end
