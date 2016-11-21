//
//  MLBPasswordTextField.h
//  MLBPasswordTextFieldDemo
//
//  Created by meilbn on 21/11/2016.
//  Copyright © 2016 meilbn. All rights reserved.
//
//  Version: 0.0.1

#import <UIKit/UIKit.h>
#import "MLBPasswordRenderView.h"

@class MLBPasswordTextField;

@protocol MLBPasswordTextFieldDelegate <NSObject>

@optional

- (void)mlb_passwordTextField:(MLBPasswordTextField *)pwdTextField didFilledPassword:(NSString *)password;

@end

IB_DESIGNABLE
@interface MLBPasswordTextField : UITextField

@property (nonatomic, assign) IBInspectable NSUInteger mlb_numberOfDigit; // default is 6

@property (nonatomic, weak) id <MLBPasswordTextFieldDelegate> mlb_delegate;

// dot
@property (nonatomic, strong) IBInspectable UIColor *mlb_dotColor; // default is black
@property (nonatomic, assign) IBInspectable CGFloat mlb_dotRadius; // default is 8.0

// border
@property (nonatomic, strong) IBInspectable UIColor *mlb_borderColor; // default is MLBPasswordRenderViewDefaultBorderColor
@property (nonatomic, assign) IBInspectable CGFloat mlb_borderWidth; // default is 0.5

@end
