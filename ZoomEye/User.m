//
//  User.m
//  ZoomEye
//
//  Created by WongEric on 16/3/23.
//  Copyright © 2016年 WongEric. All rights reserved.
//

#import "User.h"

@implementation User

- (instancetype)initWithUsername:(NSString *)name password:(NSString *)password {
    if (self = [super init]) {
        _username = name;
        _password = password;
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        self.username = [aDecoder decodeObjectForKey:@"username"];
        self.password = [aDecoder decodeObjectForKey:@"password"];
        self.access_token = [aDecoder decodeObjectForKey:@"access_token"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.username forKey:@"username"];
    [aCoder encodeObject:self.password forKey:@"password"];
    [aCoder encodeObject:self.access_token forKey:@"access_token"];
}

@end
