//
//  ViewController.m
//  XMBadgeView
//
//  Created by 钱海超 on 2018/4/18.
//  Copyright © 2018年 北京大账房信息技术有限公司. All rights reserved.
//

#import "ViewController.h"
#import "XMBadgeView.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.navigationController.tabBarItem xm_addBadgeWithDot:nil];

}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];

//    [self.navigationItem.rightBarButtonItem xm_addBadgeWithText:@"99+"];
    [self.navigationItem.rightBarButtonItem xm_setBadgeHeight:10];
//    [self.navigationItem.rightBarButtonItem xm_setBadgeFlexMode:XMBadgeViewFlexModeMiddle];

}


@end
