//
//  ViewController.m
//  objCApp
//
//  Created by Mac on 9/26/17.
//  Copyright © 2017 Mac. All rights reserved.
//

#import "ViewController.h"
#import "MyObject.h"
@interface ViewController ()

@end

@implementation ViewController
@synthesize str;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    for (int i = 0; i<10; i++) {
        
    }
    
    [str characterAtIndex:0];
    unichar * needThis = NULL;
    [str getCharacters:needThis];
    
    NSLog(@"%@", needThis);
    
    MyObject * mo = [[MyObject alloc] init ];
    [mo changeName:@"ur lazy bruh"];
    [mo changeSize:10];
    NSLog(@"%@ %d", mo.name, mo.size);
    
    NSURL * url = [[NSURL alloc] initWithString:@"blablabla"];
    
    [NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
    } ].resume;
//    mo = nil;
//    [mo release];
    
//    NSOperationQueue * myQueue = [[NSOperationQueue alloc] init];
//    [myQueue addOperation:<#(nonnull NSOperation *)#>]
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)changeStr {
//    [self str] Triggering
    self.str = @"supd00d"; //Accessing self.str
}


@end
