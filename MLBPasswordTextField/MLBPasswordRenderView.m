//
//  MLBPasswordRenderView.m
//  MLBPasswordTextFieldDemo
//
//  Created by meilbn on 21/11/2016.
//  Copyright © 2016 meilbn. All rights reserved.
//

#import "MLBPasswordRenderView.h"

#define MLB_DEGREES_TO_RADIANS(degrees)                 ((M_PI * degrees) / 180)

CGRect MLBRectFor1PxStroke(CGRect rect) {
    return CGRectMake(rect.origin.x + 0.5, rect.origin.y + 0.5, rect.size.width - 1, rect.size.height - 1);
}

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
        
        CGContextAddRect(borderContext, MLBRectFor1PxStroke(self.bounds));
        
        if (_mlb_rNumberOfDot > 0) {
            CGFloat segmentWidth = CGRectGetWidth(self.bounds) / _mlb_rNumberOfDot;
            CGFloat lineHeight = CGRectGetHeight(self.bounds);
            
            for (int i = 1; i < _mlb_rNumberOfDot; i++) {
                CGFloat pointX = i * segmentWidth - _mlb_rBorderWidth + 0.5;
                CGContextMoveToPoint(borderContext, pointX, 0);
                CGContextAddLineToPoint(borderContext, pointX, lineHeight - _mlb_rBorderWidth - 0.5);
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
        CGFloat centerX = segmentWidth / 2;
        CGFloat height = CGRectGetHeight(self.bounds);
        CGFloat centerY = height / 2;
        
        for (int i = 1; i <= _mlb_rCurrentNumberOfDot; i++) {
            CGContextFillEllipseInRect(dotContext, CGRectMake(centerX - _mlb_rDotRadius, centerY - _mlb_rDotRadius, _mlb_rDotRadius * 2, _mlb_rDotRadius * 2));
            centerX += segmentWidth;
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
}

#pragma mark - Setter

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
    }
}

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

@end
