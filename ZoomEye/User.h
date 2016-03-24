//
//  User.h
//  ZoomEye
//
//  Created by WongEric on 16/3/23.
//  Copyright © 2016年 WongEric. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject <NSCoding>

@property (nonatomic, copy) NSString *username;
@property (nonatomic, copy) NSString *password;

@property (nonatomic, copy) NSString *access_token;

- (instancetype)initWithUsername:(NSString *)name password:(NSString *)password;

@end
