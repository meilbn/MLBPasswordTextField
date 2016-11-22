//
//  MLBPasswordRenderView.m
//  MLBPasswordTextFieldDemo
//
//  Created by meilbn on 21/11/2016.
//  Copyright © 2016 meilbn. All rights reserved.
//

#import "MLBPasswordRenderView.h"

#define MLB_DEGREES_TO_RADIANS(degrees)                 ((M_PI * degrees) / 180)
#define MLBPasswordRenderViewDefaultBorderColor         [UIColor colorWithWhite:204 / 255.0 alpha:1] // #FFCCCCCC
#define MLBPasswordDefaultCursorColor                   [UIColor colorWithRed:66 / 255.0 green:107 / 255.0 blue:242 / 255.0 alpha:1] // #FF426BF2

CGRect MLBRectFor1PxStroke(CGRect rect) {
    return CGRectMake(rect.origin.x + 0.5, rect.origin.y + 0.5, rect.size.width - 1, rect.size.height - 1);
}

NSUInteger const kMLBPasswordTextFieldDefaultNumberOfDigit = 6;

NSString *const kMLBPasswordRenderViewCursorAnimationKeyPath = @"opacity";

@interface MLBPasswordRenderView ()

@property (strong, nonatomic) UIView *cursorView;

@end

@implementation MLBPasswordRenderView

#pragma mark - View Lifecycle

- (instancetype)init {
    if (self = [super init]) {
        [self mlb_setup];
    }
    
    return self;
}

#pragma mark - Parent Methods

- (void)drawRect:(CGRect)rect {
    if (_mlb_rBorderWidth > 0) {
        CGContextRef borderContext = UIGraphicsGetCurrentContext();
        CGContextSetLineWidth(borderContext, _mlb_rBorderWidth);
        CGContextSetStrokeColorWithColor(borderContext, _mlb_rBorderColor.CGColor);
        CGContextSetAllowsAntialiasing(borderContext, false);
        CGContextSetShouldAntialias(borderContext, false);
        
        CGContextAddRect(borderContext, MLBRectFor1PxStroke(self.bounds));
        
        if (_mlb_rNumberOfDot > 0) {
            CGFloat segmentWidth = CGRectGetWidth(self.bounds) / _mlb_rNumberOfDot;
            CGFloat lineHeight = CGRectGetHeight(self.bounds);
            
            for (int i = 1; i < _mlb_rNumberOfDot; i++) {
                CGFloat pointX = i * segmentWidth - _mlb_rBorderWidth;
                CGContextMoveToPoint(borderContext, pointX, 0);
                CGContextAddLineToPoint(borderContext, pointX, lineHeight - _mlb_rBorderWidth);
            }
        }
        
        CGContextStrokePath(borderContext);
    }
    
    if (_mlb_rCurrentNumberOfDot > 0 && _mlb_rDotRadius > 0) {
        CGContextRef dotContext = UIGraphicsGetCurrentContext();
        CGContextSetLineWidth(dotContext, _mlb_rDotRadius);
        CGContextSetStrokeColorWithColor(dotContext, _mlb_rDotColor.CGColor);
        CGContextSetAllowsAntialiasing(dotContext, true);
        CGContextSetShouldAntialias(dotContext, true);
        
        CGFloat segmentWidth = CGRectGetWidth(self.bounds) / _mlb_rNumberOfDot;
        CGFloat height = CGRectGetHeight(self.bounds);
        CGFloat centerY = height / 2.0;
        
        for (int i = 0; i < _mlb_rCurrentNumberOfDot; i++) {
            CGFloat centerX = segmentWidth / 2.0 + i * segmentWidth;
            CGContextFillEllipseInRect(dotContext, CGRectMake(centerX - _mlb_rDotRadius, centerY - _mlb_rDotRadius, _mlb_rDotRadius * 2, _mlb_rDotRadius * 2));
        }
        
        CGContextStrokePath(dotContext);
    }
}

#pragma mark - Private Methods

- (void)mlb_setup {
    self.backgroundColor = [UIColor clearColor];
    self.userInteractionEnabled = NO;
    self.translatesAutoresizingMaskIntoConstraints = NO;
    self.contentMode = UIViewContentModeRedraw;
    
    _mlb_rCurrentNumberOfDot = 0;
    _mlb_rNumberOfDot = kMLBPasswordTextFieldDefaultNumberOfDigit;
    _mlb_rDotColor = [UIColor blackColor];
    _mlb_rDotRadius = 8.0;
    _mlb_rBorderColor = MLBPasswordRenderViewDefaultBorderColor;
    _mlb_rBorderWidth = 0.5;
    _mlb_rCursorColor = MLBPasswordDefaultCursorColor;
    _mlb_rCursorWidth = 2.0;
    _mlb_rCursorHeight = 20.0;
}

- (void)mlb_layoutCursor {
    if (!_mlb_rShowCursor) {
        return;
    }
    
    if (_mlb_rCurrentNumberOfDot < _mlb_rNumberOfDot) {
        CGFloat segmentWidth = CGRectGetWidth(self.bounds) / _mlb_rNumberOfDot;
        CGPoint cursorCenter = self.cursorView.center;
        cursorCenter.x = segmentWidth / 2.0 + _mlb_rCurrentNumberOfDot * segmentWidth;
        cursorCenter.y = CGRectGetMidY(self.bounds);
        self.cursorView.center = cursorCenter;
        
        [self mlb_beginCursorAnimation];
    } else {
        [self mlb_endCursorAnimation];
    }
}

- (void)mlb_updateCursorViewSize {
    CGRect cursorBounds = self.cursorView.bounds;
    cursorBounds.size = CGSizeMake(_mlb_rCursorWidth, _mlb_rCursorHeight);
    self.cursorView.bounds = cursorBounds;
    
    [self mlb_layoutCursor];
}

- (void)mlb_beginCursorAnimation {
    if (!_mlb_rShowCursor) {
        return;
    }
    
    self.cursorView.hidden = NO;
    
    CABasicAnimation *animation = (CABasicAnimation *)[[self.cursorView layer] animationForKey:kMLBPasswordRenderViewCursorAnimationKeyPath];
    if (!animation) {
        animation = [CABasicAnimation animationWithKeyPath:kMLBPasswordRenderViewCursorAnimationKeyPath];
        [animation setFromValue:[NSNumber numberWithFloat:1.0]];
        [animation setToValue:[NSNumber numberWithFloat:0.0]];
        [animation setDuration:0.5f];
        [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]];
        [animation setAutoreverses:YES];
        [animation setRepeatCount:HUGE_VALF];
        [[self.cursorView layer] addAnimation:animation forKey:kMLBPasswordRenderViewCursorAnimationKeyPath];
    }
}

- (void)mlb_endCursorAnimation {
    self.cursorView.hidden = YES;
    [[self.cursorView layer] removeAnimationForKey:kMLBPasswordRenderViewCursorAnimationKeyPath];
}

#pragma mark - Getter

- (UIView *)cursorView {
    if (!_cursorView) {
        self.cursorView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, _mlb_rCursorWidth, _mlb_rCursorHeight)];
        self.cursorView.backgroundColor = [UIColor blueColor];
        [self addSubview:self.cursorView];
        self.cursorView.hidden = YES;
    }
    
    return _cursorView;
}

#pragma mark - Setter

- (void)setMlb_rBorderColor:(UIColor *)mlb_rBorderColor {
    if (_mlb_rBorderColor != mlb_rBorderColor) {
        _mlb_rBorderColor = mlb_rBorderColor;
        [self setNeedsDisplay];
    }
}

- (void)setMlb_rBorderWidth:(CGFloat)mlb_rBorderWidth {
    if (_mlb_rBorderWidth != mlb_rBorderWidth) {
        _mlb_rBorderWidth = mlb_rBorderWidth;
        [self setNeedsDisplay];
    }
}

- (void)setMlb_rNumberOfDot:(NSUInteger)mlb_rNumberOfDot {
    if (_mlb_rNumberOfDot != mlb_rNumberOfDot) {
        _mlb_rNumberOfDot = mlb_rNumberOfDot;
        [self setNeedsDisplay];
    }
}

- (void)setMlb_rCurrentNumberOfDot:(NSUInteger)mlb_rCurrentNumberOfDot {
    if (_mlb_rCurrentNumberOfDot != mlb_rCurrentNumberOfDot) {
        _mlb_rCurrentNumberOfDot = mlb_rCurrentNumberOfDot;
        [self setNeedsDisplay];
        
        [self mlb_layoutCursor];
    }
}

- (void)setMlb_rDotColor:(UIColor *)mlb_rDotColor {
    if (_mlb_rDotColor != mlb_rDotColor) {
        _mlb_rDotColor = mlb_rDotColor;
        [self setNeedsDisplay];
    }
}

- (void)setMlb_rDotRadius:(CGFloat)mlb_rDotRadius {
    if (_mlb_rDotRadius != mlb_rDotRadius) {
        _mlb_rDotRadius = mlb_rDotRadius;
        [self setNeedsDisplay];
    }
}

- (void)setMlb_rCursorColor:(UIColor *)mlb_rCursorColor {
    if (_mlb_rCursorColor != mlb_rCursorColor) {
        _mlb_rCursorColor = mlb_rCursorColor;
        self.cursorView.backgroundColor = _mlb_rCursorColor;
    }
}

- (void)setMlb_rCursorWidth:(CGFloat)mlb_rCursorWidth {
    if (_mlb_rCursorWidth != mlb_rCursorWidth) {
        _mlb_rCursorWidth = mlb_rCursorWidth;
        [self mlb_updateCursorViewSize];
    }
}

- (void)setMlb_rCursorHeight:(CGFloat)mlb_rCursorHeight {
    if (_mlb_rCursorHeight != mlb_rCursorHeight) {
        _mlb_rCursorHeight = mlb_rCursorHeight;
        [self mlb_updateCursorViewSize];
    }
}

- (void)setMlb_rShowCursor:(BOOL)mlb_rShowCursor {
    _mlb_rShowCursor = mlb_rShowCursor;
    
    if (_mlb_rShowCursor) {
        [self mlb_layoutCursor];
    } else {
        [self mlb_endCursorAnimation];
    }
}

@end
