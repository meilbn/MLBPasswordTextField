//
//  MLBPasswordRenderView.h
//  MLBPasswordTextFieldDemo
//
//  Created by meilbn on 21/11/2016.
//  Copyright © 2016 meilbn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MLBPasswordRenderView : UIView

// dot
@property (nonatomic, assign) NSUInteger mlb_rNumberOfDot; // DO NOT modify directly, instead use textField's mlb_numberOfDigit
@property (nonatomic, assign) NSUInteger mlb_rCurrentNumberOfDot;

@property (nonatomic, strong) UIColor *mlb_rDotColor;
@property (nonatomic, assign) CGFloat mlb_rDotRadius;

// border
@property (nonatomic, strong) UIColor *mlb_rBorderColor;
@property (nonatomic, assign) CGFloat mlb_rBorderWidth;

@end
