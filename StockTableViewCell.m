//
//  StockTableViewCell.m
//  InteviewTest
//
//  Created by Yiyun Liang on 2/9/15.
//  Copyright (c) 2015 Yiyun Liang. All rights reserved.
//

#import "StockTableViewCell.h"

#define FONT_SIZE 14.0f
#define CELL_CONTENT_WIDTH [UIScreen mainScreen].bounds.size.width-105
#define CELL_CONTENT_MARGIN 10.0f

@implementation StockTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if ((self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])) {
        
    }
    return self;
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)getProductNumberLabel:(NSString *) productNumber getProductDescription:(NSString *) productDescription getLocationName:(NSString *) locationName getQuantity:(NSString *) quantity{
    
    [self setBackgroundColor:[UIColor whiteColor]];
    
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, CELL_CONTENT_WIDTH, 20)];
    label.font = [UIFont boldSystemFontOfSize:14.0f];
    label.numberOfLines = 0;
    label.textAlignment = NSTextAlignmentJustified;
    [label setBackgroundColor:[UIColor whiteColor]];
    
    
    NSLog(@"%lu",(unsigned long)productNumber.length);
    NSLog(@"%lu",(unsigned long)productDescription.length);
    
    NSString *str = [@"\n" stringByAppendingFormat:@"%@\n\n%@\n\n%@\n",productNumber,productDescription,locationName];
    
    NSLog(@"%lu",(unsigned long)str.length);
    
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:str];
    
    [string addAttribute:NSForegroundColorAttributeName value:[UIColor grayColor] range:NSMakeRange(productNumber.length+3, productDescription.length)];
    [string addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:30/255.0 green:144/255.0 blue:255/255.0 alpha:1] range:NSMakeRange(productNumber.length+productDescription.length+3,locationName.length+2)];
    
    [string addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Arial-BoldItalicMT" size:15.0] range:NSMakeRange(1, productNumber.length)];
    [string addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Arial" size:10.0] range:NSMakeRange(productNumber.length+3, productDescription.length)];
    [string addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Arial" size:10.0] range:NSMakeRange(productNumber.length+productDescription.length+3,locationName.length+2)];
    
    CGSize size = [string boundingRectWithSize:CGSizeMake(CELL_CONTENT_WIDTH, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin context:nil].size;
    
    
    [label setFrame:CGRectMake(15, 0, CELL_CONTENT_WIDTH, size.height)];
    [label setAttributedText:string];
    
    [self.contentView addSubview:label];
    
    
    
    UILabel *quantityLabel = [[UILabel alloc] initWithFrame:CGRectMake(CELL_CONTENT_WIDTH+55, size.height/2, 50, 20)];
    quantityLabel.font = [UIFont boldSystemFontOfSize:12.0f];
    quantityLabel.numberOfLines = 1;
    quantityLabel.textColor =[UIColor colorWithRed:32/255.0 green:178/255.0 blue:170/255.0 alpha:1];
    quantityLabel.text=quantity;
    
    [self.contentView addSubview:quantityLabel];
    
}

@end
