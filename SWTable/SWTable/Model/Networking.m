//
//  Networking.m
//  SWTable
//
//  Created by Mac on 9/26/17.
//  Copyright © 2017 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "Networking.h"

@interface Networking ()

@end

@implementation Networking

+ (void) callApi: (int) page thenBlock:(void (^)(NSDictionary * jsonObject)) completion {
    
    NSString * str = [NSString stringWithFormat:@"https://swapi.co/api/people/?page=%i", page];
    NSURL * url = [[NSURL alloc] initWithString:str];
    [NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        id jsonObject = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        if ([jsonObject isKindOfClass:[NSDictionary class]] && error == nil) {
            completion(jsonObject);
        } else {
            NSLog(@"%@", error);
            NSLog(@"%@", response);
        }
    } ].resume;
}

+ (void) callImageApi: (NSString *) name thenBlock:(void (^)(UIImage * image)) completion {
    
    NSString *urlName = [name stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSString * urlStr = [NSString stringWithFormat:@"https://raw.githubusercontent.com/sbassett1/swImages/master/%@%@", urlName, @".png"];
    
    NSURL * url = [[NSURL alloc] initWithString:urlStr];
    [NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error == nil) {
            UIImage *image = [UIImage imageWithData:data];
            completion(image);
        }
        
    } ].resume;
}

@end
