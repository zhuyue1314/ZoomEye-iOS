//
//  LoginViewController.m
//  ZoomEye
//
//  Created by WongEric on 16/3/23.
//  Copyright © 2016年 WongEric. All rights reserved.
//

#import "LoginViewController.h"
#import "User.h"
#import <AFNetworking/AFNetworking.h>
#import "AccountTool.h"



@interface LoginViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *userNameTextField;

@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.userNameTextField.delegate = self;
    self.passwordTextField.delegate = self;
    
    
}
- (IBAction)Login:(UIButton *)sender {
    User *user = [[User alloc] init];
    
    NSDictionary *params = @{
                             @"username" : self.userNameTextField.text,
                             @"password" : self.passwordTextField.text
                             };
    NSLog(@"%@", params);
    NSURL *url = [NSURL URLWithString:@"http://api.zoomeye.org/user/login"];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    [request setHTTPMethod:@"POST"];
    NSData *postdata = [NSJSONSerialization dataWithJSONObject:params options:NSJSONReadingAllowFragments error:nil];
    [request setHTTPBody:postdata];
    NSURLResponse *response;
    
    NSError *error;
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:nil];
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
    if (error == nil) {
        user.access_token = dic[@"access_token"];
        user.username = self.userNameTextField.text;
        user.password = self.passwordTextField.text;
        [AccountTool save:user];
        [self performSegueWithIdentifier:@"Success" sender:sender];
    }
}

@end
