//
//  UITabBarItem+XMBadgeView.m
//  XMBadgeView
//
//  Created by 钱海超 on 2018/4/18.
//  Copyright © 2018年 北京大账房信息技术有限公司. All rights reserved.
//

#import "UITabBarItem+XMBadgeView.h"

@implementation UITabBarItem (XMBadgeView)

/**
 * 添加带文本内容的badge 默认是右上角  红色 18pt
 */
- (void)xm_addBadgeWithText:(NSString *)text
{
    [[self getView] xm_addBadgeWithText:text];
}

/**
 * 添加带数字内容的badge 默认是右上角  红色 18pt
 */
- (void)xm_addBadgeWithNumber:(NSInteger)number
{
    [[self getView] xm_addBadgeWithNumber:number];
}

/**
 * 添加带颜色的小圆点 默认是右上角  红色 8pt
 */
- (void)xm_addBadgeWithDot:(UIColor *)color
{
    [[self getView] xm_addBadgeWithDot:color];
}

/**
 * 设置Badge的高度，因为Badge的宽度是动态改变的，通过改变Badge的高度，其宽度也按照比例变化，方便布局
 * 注意:此方法需要在Badge添加到控件上后调用
 */
- (void)xm_setBadgeHeight:(CGFloat)height
{
    [[self getView] xm_setBadgeHeight:height];
}

/**
 * 设置Badge的偏移量 Badge的中心点默认在父控件的右上角
 * x < 0 左移  x > 0 右移
 * y < 0 下移  y > 0 上移
 */
- (void)xm_setBadgeOffsetWtihX:(CGFloat)x Y:(CGFloat)y
{
    [[self getView] xm_setBadgeOffsetWtihX:x Y:y];
}

/**
 * 设置Badge的伸缩方向
 * XMBadgeViewFlexModeHead      向左伸缩
 * XMBadgeViewFlexModeMiddle    左右伸缩
 * XMBadgeViewFlexModeTrail     向右伸缩
 */
- (void)xm_setBadgeFlexMode:(XMBadgeViewFlexMode)flexMode
{
    [[self getView] xm_setBadgeFlexMode:flexMode];
}

/**
 * 设置BadgeLabel属性
 */
- (void)xm_setBadgeLabelAttribute:(void(^)(XMBadgeLabel *badgeLabel))attributes
{
    [[self getView] xm_setBadgeLabelAttribute:attributes];
}

/**
 * 显示Badge
 */
- (void)xm_showBadge
{
    [[self getView] xm_showBadge];
}
/**
 * 隐藏Badge
 */
- (void)xm_hideBadge
{
    [[self getView] xm_hideBadge];
}


/*****  扩展方法    *****/
/**
 * 数字增加/减少  只适用于Badge内容为数字的时候
 */
- (void)xm_increase
{
    [[self getView] xm_increase];
}
- (void)xm_increaseBy:(NSInteger)number
{
    [[self getView] xm_increaseBy:number];
}
- (void)xm_decrease
{
    [[self getView] xm_decrease];
}
- (void)xm_decreaseBy:(NSInteger)number
{
    [[self getView] xm_decreaseBy:number];
}

#pragma mark - 获取Badge的父视图
- (UIView *)getView
{
    UIView *tabBarButton = [self valueForKey:@"_view"];
    for (UIView *subView in tabBarButton.subviews) {
        if(subView.superclass == NSClassFromString(@"UIImageView")){
            return subView;
        }
    }
    return tabBarButton;
}

@end
