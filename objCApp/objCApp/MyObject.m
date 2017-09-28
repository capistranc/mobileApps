//
//  MyObject.m
//  objCApp
//
//  Created by Mac on 9/26/17.
//  Copyright © 2017 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyObject.h"

@interface MyObject ()
@property (copy, readwrite) NSString * name;
@property (unsafe_unretained, readwrite) int size;

@end

@implementation MyObject
@synthesize name;
@synthesize size;

-(void) changeName:(NSString *) name {
    self.name = name;
}
-(void) changeSize:(int) size {
    self.size = size;
    
    [self myFunctionWithBlock:^(int myInt) {
        dispatch_queue_t serialQueue = dispatch_queue_create("com.example.CriticalTaskQueue", NULL);
        dispatch_async(serialQueue, ^{
            for(int i = 0; i < myInt; i++){
                NSLog(@"%d", i);
            }
        });
    }];
    
}

-(void) changeObject:(int)size thenName:(NSString *)name {
    //    [self myFunctionWithBlock:^{
    //        NSLog(@"NERDD");
    //    }];
    
}

-(void) myFunctionWithBlock:(void (^)(int myInt)) blockName {
    blockName(5);
}

@end

//Fill tableview with starwars images
//
