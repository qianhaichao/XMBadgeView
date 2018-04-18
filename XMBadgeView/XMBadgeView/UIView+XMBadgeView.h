//
//  UIView+XMBadgeView.h
//  XMBadgeView
//
//  Created by 钱海超 on 2018/4/18.
//  Copyright © 2018年 北京大账房信息技术有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XMBadgeLabel;
typedef NS_ENUM(NSUInteger, XMBadgeViewFlexMode);

@protocol XMBadgeViewDelegate<NSObject>

@required
/**
 * 添加带文本内容的badge 默认是右上角  红色 18pt
 */
- (void)xm_addBadgeWithText:(NSString *)text;

/**
 * 添加带数字内容的badge 默认是右上角  红色 18pt
 */
- (void)xm_addBadgeWithNumber:(NSInteger)number;

/**
 * 添加带颜色的小圆点 默认是右上角  红色 8pt
 */
- (void)xm_addBadgeWithDot:(UIColor *)color;

/**
 * 设置Badge的高度，因为Badge的宽度是动态改变的，通过改变Badge的高度，其宽度也按照比例变化，方便布局
 * 注意:此方法需要在Badge添加到控件上后调用
 */
- (void)xm_setBadgeHeight:(CGFloat)height;

/**
 * 设置Badge的偏移量 Badge的中心点默认在父控件的右上角
 * x < 0 左移  x > 0 右移
 * y < 0 下移  y > 0 上移
 */
- (void)xm_setBadgeOffsetWtihX:(CGFloat)x Y:(CGFloat)y;

/**
 * 设置Badge的伸缩方向
 * XMBadgeViewFlexModeHead      向左伸缩
 * XMBadgeViewFlexModeMiddle    左右伸缩
 * XMBadgeViewFlexModeTrail     向右伸缩
 */
- (void)xm_setBadgeFlexMode:(XMBadgeViewFlexMode)flexMode;

/**
 * 设置BadgeLabel属性
 */
- (void)xm_setBadgeLabelAttribute:(void(^)(XMBadgeLabel *badgeLabel))attributes;

/**
 * 显示Badge
 */
- (void)xm_showBadge;
/**
 * 隐藏Badge
 */
- (void)xm_hideBadge;


/*****  扩展方法    *****/
/**
 * 数字增加/减少  只适用于Badge内容为数字的时候
 */
- (void)xm_increase;
- (void)xm_increaseBy:(NSInteger)number;
- (void)xm_decrease;
- (void)xm_decreaseBy:(NSInteger)number;

@end

@interface UIView (XMBadgeView)<XMBadgeViewDelegate>

@end


@interface UIView(XMFrame)
@property (nonatomic,assign) CGFloat       xm_x;
@property (nonatomic,assign) CGFloat       xm_y;
@property (nonatomic,assign) CGFloat       xm_right;
@property (nonatomic,assign) CGFloat       xm_bottom;
@property (nonatomic,assign) CGFloat       xm_width;
@property (nonatomic,assign) CGFloat       xm_height;
@property (nonatomic,assign) CGFloat       xm_centerX;
@property (nonatomic,assign) CGFloat       xm_centerY;
@end
