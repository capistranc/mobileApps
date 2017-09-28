//
//  MyObject.h
//  objCApp
//
//  Created by Mac on 9/26/17.
//  Copyright © 2017 Mac. All rights reserved.
//
#import <UIKit/UIKit.h>

@interface MyObject : NSObject

@property (readonly) NSString * name;
@property (readonly) int size;
-(void) changeName:(NSString *) name;
-(void) changeSize:(int) size;
-(void) changeObject:(int) size thenName: (NSString *) name;

@end
//
//#ifndef MyObject_h
//#define MyObject_h
//
//
//#endif /* MyObject_h */

