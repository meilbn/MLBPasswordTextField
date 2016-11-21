//
//  UIView+MLBUtilities.m
//  MLBArmyKnife
//
//  Created by meilbn on 4/18/16.
//  Copyright © 2016 meilbn. All rights reserved.
//

#import "UIView+MLBUtilities.h"
#import <objc/runtime.h>

static char kMLBViewKeyAssociatedObjectKey;

@implementation UIView (MLBUtilities)

#pragma mark - Setter

- (void)setX:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (void)setY:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (void)setCenterX:(CGFloat)centerX {
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

- (void)setCenterY:(CGFloat)centerY {
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

- (void)setWidth:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (void)setHeight:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (void)setSize:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (void)setOrigin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (void)setTop:(CGFloat)t {
	self.frame = CGRectMake(self.left, t, self.width, self.height);
}

- (void)setLeft:(CGFloat)l {
	self.frame = CGRectMake(l, self.top, self.width, self.height);
}

- (void)setBottom:(CGFloat)b {
	self.frame = CGRectMake(self.left, b - self.height, self.width, self.height);
}

- (void)setRight:(CGFloat)r {
	self.frame = CGRectMake(r - self.width, self.top, self.width, self.height);
}

- (void)setKey:(NSString *)key {
	objc_setAssociatedObject(self, &kMLBViewKeyAssociatedObjectKey, key, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

#pragma mark - Getter

- (CGFloat)x {
	return self.frame.origin.x;
}

- (CGFloat)y {
	return self.frame.origin.y;
}

- (CGFloat)centerX {
	return self.center.x;
}

- (CGFloat)centerY {
	return self.center.y;
}

- (CGFloat)width {
	return self.frame.size.width;
}

- (CGFloat)height {
	return self.frame.size.height;
}

- (CGSize)size {
    return self.frame.size;
}

- (CGPoint)origin {
    return self.frame.origin;
}

- (CGFloat)top {
    return self.frame.origin.y;
}

- (CGFloat)left {
	return self.frame.origin.x;
}

- (CGFloat)bottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (CGFloat)right {
    return self.frame.origin.x + self.frame.size.width;
}

- (NSString *)key {
	NSString *k = objc_getAssociatedObject(self, &kMLBViewKeyAssociatedObjectKey);
	if ([k isKindOfClass:[NSString class]]) {
		return k;
	} else {
		return @"";
	}
}

#pragma mark - Public Methods

/**
 *  判断某个点是否在视图区域内，针对 transform 做了转换计算，并提供 UIEdgeInsets 缩放区域的参数
 *
 *  @param point  要判断的点坐标
 *  @param view   传入的视图，一定要与本视图处于同一视图树中
 *  @param insets UIEdgeInsets参数可以调整判断的边界
 *
 *  @return BOOL类型，返回点坐标是否位于视图内
 */
- (BOOL)checkPoint:(CGPoint)point inView:(UIView *)view withInsets:(UIEdgeInsets)insets {
	// 将点坐标转化为视图内坐标系的点，消除 transform 带来的影响
	CGPoint convertedPoint = [self convertPoint:point toView:view];
	CGAffineTransform viewTransform = view.transform;
	// 计算视图缩放比例
	CGFloat scale = sqrt(viewTransform.a * viewTransform.a + viewTransform.c * viewTransform.c);
	// 将 UIEdgeInsets 除以缩放比例，以便得到真实的『周围区域』
	UIEdgeInsets scaledInsets = (UIEdgeInsets){insets.top/scale,insets.left/scale,insets.bottom/scale,insets.right/scale};
	CGRect resultRect = UIEdgeInsetsInsetRect(view.bounds, scaledInsets);
	// 判断给定坐标点是否在区域内
	if (CGRectContainsPoint(resultRect, convertedPoint)) {
		return YES;
	}
	return NO;
}

@end
