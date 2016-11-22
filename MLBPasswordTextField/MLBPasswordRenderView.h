//
//  MLBPasswordRenderView.h
//  MLBPasswordTextFieldDemo
//
//  Created by meilbn on 21/11/2016.
//  Copyright © 2016 meilbn. All rights reserved.
//

#import <UIKit/UIKit.h>

UIKIT_EXTERN NSUInteger const kMLBPasswordTextFieldDefaultNumberOfDigit;

@interface MLBPasswordRenderView : UIView

// border
@property (nonatomic, strong) UIColor *mlb_rBorderColor; // default is MLBPasswordRenderViewDefaultBorderColor
@property (nonatomic, assign) CGFloat mlb_rBorderWidth; // default is 0.5

// dot
@property (nonatomic, assign) NSUInteger mlb_rNumberOfDot; //  // default is 6, DO NOT modify directly, instead use textField's mlb_numberOfDigit
@property (nonatomic, assign) NSUInteger mlb_rCurrentNumberOfDot; // default is 0

@property (nonatomic, strong) UIColor *mlb_rDotColor; // default is black
@property (nonatomic, assign) CGFloat mlb_rDotRadius; // default is 8.0

// cursor
@property (nonatomic, strong) UIColor *mlb_rCursorColor; // default is MLBPasswordDefaultCursorColor, like UITextField's cursor
@property (nonatomic, assign) CGFloat mlb_rCursorWidth; // default is 2, like UITextField's cursor
@property (nonatomic, assign) CGFloat mlb_rCursorHeight; // default is 20

@property (nonatomic, assign) BOOL mlb_rShowCursor; // default is NO

@end
