//
//  ViewController.m
//  MLBPasswordTextFieldDemo
//
//  Created by meilbn on 21/11/2016.
//  Copyright © 2016 meilbn. All rights reserved.
//

#import "ViewController.h"
#import "MLBPasswordTextField.h"
#import "UIView+MLBUtilities.h"

@interface ViewController () <MLBPasswordTextFieldDelegate>

@end

@implementation ViewController

#pragma mark - View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.view.backgroundColor = [UIColor blackColor];
    
    [self initDatas];
    [self setupViews];
}

#pragma mark - Private Methods

- (void)initDatas {
    
}

- (void)setupViews {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 30, 50, 20)];
    label.text = @"In Code";
    [label sizeToFit];
    label.centerX = self.view.centerX;
    [self.view addSubview:label];
    
    MLBPasswordTextField *textField0 = [[MLBPasswordTextField alloc] initWithFrame:CGRectMake(0, label.bottom + 15, 240, 40)];
    textField0.centerX = self.view.centerX;
    textField0.mlb_delegate = self;
    textField0.mlb_borderWidth = 1;
    [self.view addSubview:textField0];
}

#pragma mark - MLBPasswordTextFieldDelegate

- (void)mlb_passwordTextField:(MLBPasswordTextField *)pwdTextField didFilledPassword:(NSString *)password {
    NSLog(@"password = %@", password);
    [pwdTextField resignFirstResponder];
}

@end
