//
//  AccountTool.m
//  ZoomEye
//
//  Created by WongEric on 16/3/24.
//  Copyright © 2016年 WongEric. All rights reserved.
//

#define AccountFilepath [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"user.data"]

#import "AccountTool.h"
#import "User.h"

@implementation AccountTool

+ (void)save:(User *)user{
    [NSKeyedArchiver archiveRootObject:user toFile:AccountFilepath];
}

+ (User *)user {
    
    User *user = [NSKeyedUnarchiver unarchiveObjectWithFile:AccountFilepath];
    
    return user;
}

@end
