//
//  StockTableViewController.m
//  InteviewTest
//
//  Created by Yiyun Liang on 2/9/15.
//  Copyright (c) 2015 Yiyun Liang. All rights reserved.
//

#import "StockTableViewController.h"
#import "StockTableViewCell.h"
#import "DataSource.h"
#import "ProductEntity.h"
#import "StockEntity.h"
#import "ProductInfo.h"
#import "LocationType.h"
#import "WarehouseEntity.h"
#import "StoreEntity.h"
#import "FormTableViewController.h"

#define FONT_SIZE 14.0f
#define CELL_CONTENT_WIDTH 280.0f
#define CELL_CONTENT_MARGIN 10.0f

@interface StockTableViewController ()

@end

@implementation StockTableViewController

@synthesize list,productList,productInfo;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self remoteAnimation:@""];
    
    [self loadTable];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [self.productInfo count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   
    
    static NSString *CellWithIdentifier = @"stock";
    
    StockTableViewCell *cell=[[StockTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellWithIdentifier];
    
    NSUInteger row = [indexPath row]+1;
    ProductInfo *tempPE=[productInfo objectForKey:[NSString stringWithFormat:@"%lu", (unsigned long)row]];
    
    [cell getProductNumberLabel:tempPE.productNumber getProductDescription:tempPE.productDescription getLocationName:tempPE.locationName getQuantity:[NSString stringWithFormat:@"%d", tempPE.quantity]];
    cell.selectionStyle=NO;
    
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    NSUInteger row = [indexPath row]+1;
    ProductInfo *tempPE=[productInfo objectForKey:[NSString stringWithFormat:@"%lu", (unsigned long)row]];
    
    NSString *str = [@"\n" stringByAppendingFormat:@"%@ \n \n%@\n\n\n%@",tempPE.productNumber,tempPE.productDescription,tempPE.locationName];
    
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:str];
    
    [string addAttribute:NSForegroundColorAttributeName value:[UIColor grayColor] range:NSMakeRange(tempPE.productNumber.length+5, tempPE.productDescription.length)];
    [string addAttribute:NSForegroundColorAttributeName value:[UIColor blueColor] range:NSMakeRange(tempPE.productNumber.length+tempPE.productDescription.length+8,tempPE.locationName.length)];
    
    [string addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Arial-BoldItalicMT" size:15.0] range:NSMakeRange(1, tempPE.productNumber.length)];
    [string addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Arial" size:10.0] range:NSMakeRange(tempPE.productNumber.length+5, tempPE.productDescription.length)];
    [string addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Arial" size:10.0] range:NSMakeRange(tempPE.productNumber.length+tempPE.productDescription.length+6,tempPE.locationName.length+2)];
    
    CGSize size = [string boundingRectWithSize:CGSizeMake(CELL_CONTENT_WIDTH, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin context:nil].size;
    
    CGFloat height = size.height;
    
    return height + (CELL_CONTENT_MARGIN * 2);
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

-(void) didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation{
    [self remoteAnimation:@""];
    [self loadTable];
}

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if (scrollView.contentOffset.y < -[UIScreen mainScreen].bounds.size.height/4+20) {
        [self remoteAnimation:@""];
        [self loadTable];
    }
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"show"]) {
        FormTableViewController *tovc = segue.destinationViewController;
        tovc.productInfo=productInfo;
    }
}

-(void)remoteAnimation:(NSString *)message{
    
    remoteAlertView =  [[UIAlertView alloc] initWithTitle:@"loading" message:message delegate:self cancelButtonTitle:nil otherButtonTitles:nil, nil ];
    UIActivityIndicatorView *aiView = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(125.0, 150.0, 30.0, 20.0)];
    aiView.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhiteLarge;
    if ([[[UIDevice currentDevice] systemVersion] compare:@"7.0"] != NSOrderedAscending) {
        [remoteAlertView setValue:aiView forKey:@"accessoryView"];
    }else{
        [remoteAlertView addSubview:aiView];
    }
    [remoteAlertView show];
    [aiView startAnimating];
}


-(void)loadTable{
    productInfo = [NSMutableDictionary dictionary];
    stockList=nil;
    storeList=nil;
    warehouseList=nil;
    productList=nil;
    
    [DataSource getStocks:^(NSArray * stockLs) {
        dispatch_async(dispatch_get_main_queue(), ^{
            stockList=stockLs;
            if(stockList!=nil && storeList!=nil && warehouseList!=nil &&productList!=nil){
                [self reloadTableView];
            }
        });
    }];
    
    [DataSource getAllStores:^(NSDictionary * storeLs) {
        dispatch_async(dispatch_get_main_queue(), ^{
            storeList=storeLs;
            if(stockList!=nil && storeList!=nil && warehouseList!=nil &&productList!=nil){
                [self reloadTableView];
            }
        });
    }];
    
    [DataSource getAllWarehouses:^(NSArray * warehouseLs) {
        dispatch_async(dispatch_get_main_queue(), ^{
            warehouseList=warehouseLs;
            if(stockList!=nil && storeList!=nil && warehouseList!=nil &&productList!=nil){
                [self reloadTableView];
            }
        });
    }];
    
    [DataSource getAllProducts:^(NSDictionary * productLs){
        dispatch_async(dispatch_get_main_queue(), ^{
            productList=productLs;
            if(stockList!=nil && storeList!=nil && warehouseList!=nil &&productList!=nil){
                [self reloadTableView];
            }
        });
    }];
}


-(void)reloadTableView{
    for (StockEntity * sentity in stockList) {
        ProductInfo *proInfo=[[ProductInfo alloc]init];
        
        proInfo.quantity=sentity.quantity;
        
        proInfo.id=sentity.id;
        
        ProductEntity *pe=[productList objectForKey:[NSString stringWithFormat:@"%d",sentity.id]];
        
        proInfo.productNumber=pe.productNumber;
        proInfo.productDescription=pe.productDescription;
        
        if(sentity.locationType==kLocationTypeWarehouse){
            WarehouseEntity *warehouseEntity=[warehouseList objectAtIndex:sentity.locationId-1];
            proInfo.locationName=warehouseEntity.name;
        }
        else{
            StoreEntity *storeEntity=[storeList objectForKey:[NSString stringWithFormat:@"%d",sentity.id]];
            proInfo.locationName=storeEntity.name;
        }
        
        [productInfo setValue:proInfo forKey:[NSString stringWithFormat:@"%d", proInfo.id]];
    }
    
    [remoteAlertView dismissWithClickedButtonIndex:0 animated:YES];
    
    
    //[self performSelectorOnMainThread:@selector(reRoadTableView) withObject:nil waitUntilDone:YES];
    [self.tableView reloadData];
}


@end
