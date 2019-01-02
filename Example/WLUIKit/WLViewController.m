//
//  WLViewController.m
//  WLUIKit
//
//  Created by nomeqc@gmail.com on 07/26/2018.
//  Copyright (c) 2018 nomeqc@gmail.com. All rights reserved.
//

#import "WLViewController.h"
#import "WLUIButton.h"

@interface WLViewController ()

@end

@implementation WLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    WLUIButton *button = [WLUIButton buttonWithType:UIButtonTypeCustom];
    button.adjustsImageWhenHighlighted = NO;
    [button setFixedImageSize:CGSizeMake(100, 100)];
    button.frame = CGRectMake(100, 100, 100, 180);
    button.titleLabel.font = [UIFont systemFontOfSize:15];
    [button setTitleColor:[UIColor darkTextColor] forState:UIControlStateNormal];
    [button setTitle:@"Girl" forState:UIControlStateNormal];
    [button setLayout:WLUIButtonLayoutTitleLeftImageRight];
    [button setTitleImageSpacing:10];
    [button setImage:[UIImage imageNamed:@"girl"] forState:UIControlStateNormal];
    
    NSLog(@"intrinsicContentSize:%@",NSStringFromCGSize([button intrinsicContentSize]));
    button.frame = ({
        CGRect frame = button.frame;
        frame.size = button.intrinsicContentSize;
        frame;
    });
    button.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:button];
    
    
    
}


@end
