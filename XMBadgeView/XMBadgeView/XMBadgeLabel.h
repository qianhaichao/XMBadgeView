//
//  XMBadgeLabel.h
//  XMBadgeView
//
//  Created by 钱海超 on 2018/4/18.
//  Copyright © 2018年 北京大账房信息技术有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, XMBadgeViewFlexMode) {
    XMBadgeViewFlexModeHead,    //向左伸缩
    XMBadgeViewFlexModeMiddle,  //左右伸缩
    XMBadgeViewFlexModeTrail,   //向右伸缩
};

@interface XMBadgeLabel : UILabel

/**
 * 默认创建BadgeLabel
 */
+ (instancetype)defaultBadgeLabel;

/***** BadgeView伸缩方向  默认是 XMBadgeViewFlexModeTrail *****/
@property (nonatomic,assign) XMBadgeViewFlexMode       flexMode;

/***** 记录Badge偏移量 *****/
@property (nonatomic,assign) CGPoint       offset;



@end
