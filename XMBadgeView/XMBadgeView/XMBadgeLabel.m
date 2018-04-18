//
//  XMBadgeLabel.m
//  XMBadgeView
//
//  Created by 钱海超 on 2018/4/18.
//  Copyright © 2018年 北京大账房信息技术有限公司. All rights reserved.
//

#import "XMBadgeLabel.h"
#import "UIView+XMBadgeView.h"
#define XMBadgeViewWidth    18  //默认徽标宽高
#define XMBadgeViewSapce    5   //默认徽标文字距控件的左右间隙

@implementation XMBadgeLabel

/**
 * 默认创建BadgeLabel
 */
+ (instancetype)defaultBadgeLabel
{
    return [[self alloc] initWithFrame:CGRectMake(0, 0, XMBadgeViewWidth, XMBadgeViewWidth)];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

        //UI布局
        [self layoutUI];
    }
    return self;
}

#pragma mark - UI布局
- (void)layoutUI
{
    self.textColor = [UIColor whiteColor];
    self.font = [UIFont systemFontOfSize:13];
    self.textAlignment = NSTextAlignmentCenter;
    self.backgroundColor = [UIColor colorWithRed:1.0 green:0.17 blue:0.15 alpha:1.0];
    self.layer.cornerRadius = self.xm_height * 0.5;
    self.layer.masksToBounds = YES;
    self.flexMode = XMBadgeViewFlexModeTrail;
}

- (void)setText:(NSString *)text
{
    [super setText:text];

    CGFloat width = [text boundingRectWithSize:CGSizeMake(MAXFLOAT, self.xm_height) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName :self.font} context:nil].size.width;

    if(self.xm_height > width + self.xm_height / XMBadgeViewWidth * 2 * XMBadgeViewSapce){
        self.xm_width = self.xm_height;
        return;
    }
    self.xm_width = self.xm_height / XMBadgeViewWidth * XMBadgeViewSapce /*left*/  + width + /*right*/self.xm_height /XMBadgeViewWidth * XMBadgeViewSapce;

}


@end
