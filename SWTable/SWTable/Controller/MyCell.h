//
//  MyCell.h
//  SWTable
//
//  Created by Mac on 9/27/17.
//  Copyright © 2017 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *myImage;
@property (weak, nonatomic) IBOutlet UILabel *myLabel;
@property (weak, nonatomic) NSString * name;
@property (weak, nonatomic) UIImage * img;

-(void) fillCell:(NSString *) name;
@end
