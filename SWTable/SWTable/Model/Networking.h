//
//  Networking.h
//  SWTable
//
//  Created by Mac on 9/26/17.
//  Copyright © 2017 Mac. All rights reserved.
//
@interface Networking: NSObject
+ (void) callApi: (int) page thenBlock: (void (^)(NSDictionary * jsonObject)) completion;
+ (void) callImageApi:(NSString *) name thenBlock:(void (^)(UIImage * image)) completion;
@end

