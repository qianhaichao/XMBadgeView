//
//  UIView+XMBadgeView.m
//  XMBadgeView
//
//  Created by 钱海超 on 2018/4/18.
//  Copyright © 2018年 北京大账房信息技术有限公司. All rights reserved.
//

#import "UIView+XMBadgeView.h"
#import "XMBadgeLabel.h"
#import <objc/runtime.h>

static NSString *const kBadgeLabel = @"kBadgeLabel";

@interface UIView ()
@property (nonatomic,strong) XMBadgeLabel       *badgeLbl;
@end

@implementation UIView (XMBadgeView)

/**
 * 添加带文本内容的badge 默认是右上角  红色 18pt
 */
- (void)xm_addBadgeWithText:(NSString *)text
{
    [self lazyLoadBadgeLbl];
    [self xm_showBadge];
    self.badgeLbl.text = text;
}

/**
 * 添加带数字内容的badge 默认是右上角  红色 18pt
 */
- (void)xm_addBadgeWithNumber:(NSInteger)number
{
    if(number <= 0){
        [self xm_addBadgeWithText:@"0"];
        [self xm_hideBadge];
        return;
    }
    [self xm_addBadgeWithText:[NSString stringWithFormat:@"%zd",number]];
}

/**
 * 添加带颜色的小圆点 默认是右上角  红色 8pt
 */
- (void)xm_addBadgeWithDot:(UIColor *)color
{
    [self xm_addBadgeWithText:nil];
    [self xm_setBadgeHeight:8];
    if(color){
        self.badgeLbl.backgroundColor = color;
    }

}

/**
 * 设置Badge的高度，因为Badge的宽度是动态改变的，通过改变Badge的高度，其宽度也按照比例变化，方便布局
 * 注意:此方法需要在Badge添加到控件上后调用
 */
- (void)xm_setBadgeHeight:(CGFloat)height
{
    CGFloat scale = height / self.badgeLbl.xm_height;
    self.badgeLbl.transform = CGAffineTransformScale(self.badgeLbl.transform, scale, scale);
}

/**
 * 设置Badge的偏移量 Badge的中心点默认在父控件的右上角
 * x < 0 左移  x > 0 右移
 * y < 0 下移  y > 0 上移
 */
- (void)xm_setBadgeOffsetWtihX:(CGFloat)x Y:(CGFloat)y
{
    [self lazyLoadBadgeLbl];

    self.badgeLbl.offset = CGPointMake(x, y);

    self.badgeLbl.xm_y = -self.badgeLbl.xm_height * 0.5 + y;

    switch (self.badgeLbl.flexMode) {
        case XMBadgeViewFlexModeHead: //向左伸缩
            self.badgeLbl.xm_right = self.badgeLbl.superview.xm_width + self.badgeLbl.xm_height *0.5 +  x;
            break;
        case XMBadgeViewFlexModeMiddle: //左右伸缩
            self.badgeLbl.center = CGPointMake(self.badgeLbl.superview.xm_width + x, 0);
            break;
        case XMBadgeViewFlexModeTrail: //向右伸缩
            self.badgeLbl.xm_x = self.badgeLbl.superview.xm_width - self.badgeLbl.xm_height *0.5 + x;
            break;
        default:
            break;
    }
}

/**
 * 设置Badge的伸缩方向
 * XMBadgeViewFlexModeHead      向左伸缩
 * XMBadgeViewFlexModeMiddle    左右伸缩
 * XMBadgeViewFlexModeTrail     向右伸缩
 */
- (void)xm_setBadgeFlexMode:(XMBadgeViewFlexMode)flexMode
{
    self.badgeLbl.flexMode = flexMode;
    [self xm_setBadgeOffsetWtihX:self.badgeLbl.offset.x Y:self.badgeLbl.offset.y];
}

/**
 * 设置BadgeLabel属性
 */
- (void)xm_setBadgeLabelAttribute:(void(^)(XMBadgeLabel *badgeLabel))attributes
{
    [self lazyLoadBadgeLbl];
    attributes ? attributes(self.badgeLbl) : nil;
}

/**
 * 显示Badge
 */
- (void)xm_showBadge
{
    self.badgeLbl.hidden = NO;
}
/**
 * 隐藏Badge
 */
- (void)xm_hideBadge
{
    self.badgeLbl.hidden = YES;
}

/*****  扩展方法    *****/
/**
 * 数字增加/减少  只适用于Badge内容为数字的时候
 */
- (void)xm_increase
{
    [self xm_increaseBy:1];
}
- (void)xm_increaseBy:(NSInteger)number
{
    NSInteger num = self.badgeLbl.text.integerValue + number;
    if(number > 0){
        [self xm_showBadge];
    }
    self.badgeLbl.text = [NSString stringWithFormat:@"%zd",num];
}
- (void)xm_decrease
{
    [self xm_decreaseBy:1];
}
- (void)xm_decreaseBy:(NSInteger)number
{
    NSInteger num = self.badgeLbl.text.integerValue - number;
    if(number <= 0){
        [self xm_hideBadge];
        self.badgeLbl.text = @"0";
        return;
    }
    self.badgeLbl.text = [NSString stringWithFormat:@"%zd",num];
}

#pragma mark - 私有方法
- (void)lazyLoadBadgeLbl
{
    if(!self.badgeLbl){
        self.badgeLbl = [XMBadgeLabel defaultBadgeLabel];
        self.badgeLbl.center = CGPointMake(self.xm_width, 0);
        [self addSubview:self.badgeLbl];
        [self bringSubviewToFront:self.badgeLbl];
    }
}

#pragma mark - getter/setter方法
- (XMBadgeLabel *)badgeLbl
{
    return objc_getAssociatedObject(self, &kBadgeLabel);
}
- (void)setBadgeLbl:(XMBadgeLabel *)badgeLbl
{
    objc_setAssociatedObject(self, &kBadgeLabel, badgeLbl, OBJC_ASSOCIATION_RETAIN);
}

@end

@implementation UIView(XMFrame)

- (void)setXm_x:(CGFloat)xm_x
{
    CGRect frame = self.frame;
    frame.origin.x = xm_x;
    self.frame = frame;
}
- (CGFloat)xm_x
{
    return self.frame.origin.x;
}
- (void)setXm_y:(CGFloat)xm_y
{
    CGRect frame = self.frame;
    frame.origin.y = xm_y;
    self.frame = frame;
}
- (CGFloat)xm_y
{
    return self.frame.origin.y;
}

- (void)setXm_right:(CGFloat)xm_right
{
    CGRect frame = self.frame;
    frame.origin.x = xm_right - frame.size.width;
    self.frame = frame;
}
- (CGFloat)xm_right
{
    return self.frame.origin.x + self.frame.size.width;
}
- (void)setXm_bottom:(CGFloat)xm_bottom
{
    CGRect frame = self.frame;
    frame.origin.y = xm_bottom - frame.size.height;
    self.frame = frame;
}
- (CGFloat)xm_bottom
{
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setXm_width:(CGFloat)xm_width
{
    CGRect frame = self.frame;
    frame.size.width = xm_width;
    self.frame = frame;
}
- (CGFloat)xm_width
{
    return self.frame.size.width;
}
- (void)setXm_height:(CGFloat)xm_height
{
    CGRect frame = self.frame;
    frame.size.height = xm_height;
    self.frame = frame;
}
- (CGFloat)xm_height
{
    return self.frame.size.height;
}
- (void)setXm_centerX:(CGFloat)xm_centerX
{
    CGPoint center = self.center;
    center.x = xm_centerX;
    self.center = center;
}
- (CGFloat)xm_centerX
{
    return self.center.x;
}
- (void)setXm_centerY:(CGFloat)xm_centerY
{
    CGPoint center = self.center;
    center.y = xm_centerY;
    self.center = center;
}
- (CGFloat)xm_centerY
{
    return self.center.y;
}

@end
