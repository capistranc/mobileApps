//
//  MyCell.m
//  SWTable
//
//  Created by Mac on 9/27/17.
//  Copyright © 2017 Mac. All rights reserved.
//

#import "MyCell.h"
#import "Networking.h"
#import <UIKit/UIKit.h>

@implementation MyCell

@synthesize myImage;
@synthesize myLabel;
@synthesize img;
@synthesize name;

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

- (void) fillCell:(NSString *) name {
    myLabel.textColor = UIColor.whiteColor;
    self.name = name;
    myLabel.text = name;
    
    [Networking callImageApi:name thenBlock:^(UIImage *image) {
        dispatch_sync(dispatch_get_main_queue(),^{
            self->myImage.image = image;
        });
    }];
    
}

@end
