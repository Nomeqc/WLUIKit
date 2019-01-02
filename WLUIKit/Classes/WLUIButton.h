//
//  XDBUIButton.h
//  XinDianBao
//
//  Created by iOSDeveloper003 on 17/1/17.
//  Copyright © 2017年 iOSDeveloper003. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  按钮图片标题对齐方式
 */
typedef NS_ENUM(NSInteger,WLUIButtonLayout) {
    /**
     *  标题在左，图片在右
     */
    WLUIButtonLayoutTitleLeftImageRight,
    /**
     *  图片在左，标题在右
     */
    WLUIButtonLayoutImageLeftTitleRight,
    /**
     *  标题在上，图片在下
     */
    WLUIButtonLayoutTitleTopImageBottom,
    /**
     *  图片在上，标题在下
     */
    WLUIButtonLayoutImageTopTitleBottom
};

@interface WLUIButton : UIButton

/**
 *  布局方式
 */
@property (assign, nonatomic) WLUIButtonLayout layout;

/**
 *  标题和图片之间距离,默认为3
 */
@property (assign, nonatomic) CGFloat titleImageSpacing;

///固定图片大小
@property (assign, nonatomic) CGSize fixedImageSize;

///固定label宽度
@property (nonatomic) CGFloat fixedLabelWidth;

///内容中心点X偏移，默认为0
@property (nonatomic) CGFloat contentCenterXOffset;

///内容中心点y偏移，默认为0
@property (nonatomic) CGFloat contentCenterYOffset;

@end
