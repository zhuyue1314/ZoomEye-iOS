//
//  SearchViewController.m
//  ZoomEye
//
//  Created by WongEric on 16/3/24.
//  Copyright © 2016年 WongEric. All rights reserved.
//

#import "SearchViewController.h"
#import "User.h"
#import "AccountTool.h"

@interface SearchViewController ()

@property (weak, nonatomic) IBOutlet UITextField *searchTextfield;
@property (nonatomic, copy) NSString *searchString;

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)hostSearch:(id)sender {
    
    NSString *searchString = [NSString stringWithFormat:@"http://api.zoomeye.org/host/search\?query=\"%@\"",self.searchTextfield.text];
    NSLog(@"%@",searchString);
    NSString *escapedPath = [searchString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    NSLog(@"%@",escapedPath);
    NSURL *url = [NSURL URLWithString:escapedPath];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    User *user = [AccountTool user];
    NSString *auth = [NSString stringWithFormat:@"JWT %@",user.access_token];

    [request setValue:auth forHTTPHeaderField:@"Authorization"];
    
    [request setHTTPMethod:@"GET"];
    NSURLResponse *response;
    NSError *error;
    NSData *reData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    if (error == nil) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:reData options:1 error:nil];
        NSLog(@"%@",dic);
    } else {
        NSLog(@"%@", error);
    }
    
    
}
@end
