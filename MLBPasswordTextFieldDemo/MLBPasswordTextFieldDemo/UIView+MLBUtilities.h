//
//  UIView+MLBUtilities.h
//  MLBArmyKnife
//
//  Created by meilbn on 4/18/16.
//  Copyright © 2016 meilbn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (MLBUtilities)

@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) CGPoint origin;

@property (nonatomic, assign) CGFloat top;
@property (nonatomic, assign) CGFloat left;
@property (nonatomic, assign) CGFloat bottom;
@property (nonatomic, assign) CGFloat right;

@property (nonatomic, copy) NSString *key; // 给 UIView 添加 key 属性，用处类似 tag

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
- (BOOL)checkPoint:(CGPoint)point inView:(UIView *)view withInsets:(UIEdgeInsets)insets;

@end
