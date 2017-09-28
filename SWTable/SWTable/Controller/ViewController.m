//
//  ViewController.m
//  SWTable
//
//  Created by Mac on 9/26/17.
//  Copyright © 2017 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "ViewController.h"
#import "Networking.h"
@interface ViewController ()

@end

@implementation ViewController
    @synthesize imageView;
    @synthesize nameLabel;
    @synthesize name;
    @synthesize image;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    imageView.image = image;
    
    
    nameLabel.text = name;
    
    NSString *formattedName = [name stringByReplacingOccurrencesOfString:@" " withString:@""];
    [Networking callImageApi:formattedName thenBlock:^(UIImage *image) {
        dispatch_sync(dispatch_get_main_queue(),^{
            self->imageView.image = image;
        });
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
