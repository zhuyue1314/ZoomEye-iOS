//
//  AccountTool.h
//  ZoomEye
//
//  Created by WongEric on 16/3/24.
//  Copyright © 2016年 WongEric. All rights reserved.
//

#import <Foundation/Foundation.h>

@class User;

@interface AccountTool : NSObject

+ (void)save:(User *)user;

+ (User *)user;

@end
