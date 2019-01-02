//
//  XDBUIButton.m
//  XinDianBao
//
//  Created by iOSDeveloper003 on 17/1/17.
//  Copyright © 2017年 iOSDeveloper003. All rights reserved.
//

#import "WLUIButton.h"

@implementation WLUIButton


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (!self) {
        return nil;
    }
    [self _baseSetup];
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (!self) {
        return nil;
    }
    [self _baseSetup];
    return self;
}

- (void)_baseSetup {
    self.adjustsImageWhenHighlighted = NO;
    self.exclusiveTouch = YES;
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    _titleImageSpacing = 3.0;
}

- (void)setFixedImageSize:(CGSize)imageSize {
    _fixedImageSize = imageSize;
    [self setNeedsLayout];
}

- (void)setLayout:(WLUIButtonLayout)layout {
    _layout = layout;
    [self setNeedsLayout];
}

- (void)setTitleImageSpacing:(CGFloat)titleImagePadding {
    _titleImageSpacing = titleImagePadding;
    [self setNeedsLayout];
}

- (CGSize)intrinsicContentSize {
    CGSize imageSize = CGSizeEqualToSize(_fixedImageSize, CGSizeZero)? self.imageView.image.size : _fixedImageSize;
    CGFloat titleImageSpacing = _titleImageSpacing;
    CGFloat labelWidth = _fixedLabelWidth > 0? _fixedLabelWidth : self.titleLabel.intrinsicContentSize.width;
    switch (_layout) {
        case WLUIButtonLayoutImageLeftTitleRight:
        case WLUIButtonLayoutTitleLeftImageRight:
        {
            return CGSizeMake(imageSize.width + titleImageSpacing + labelWidth , MAX(self.titleLabel.intrinsicContentSize.height, imageSize.height) );
        }
            break;
        case WLUIButtonLayoutImageTopTitleBottom:
        case WLUIButtonLayoutTitleTopImageBottom:
        {
            return CGSizeMake(MAX(labelWidth, imageSize.width) , imageSize.height + titleImageSpacing + self.titleLabel.intrinsicContentSize.height );
        }
            break;
    }
    return CGSizeZero;
}

- (CGSize)sizeThatFits:(CGSize)size {
    return [self intrinsicContentSize];
}

#pragma mark - Accessors

- (void)layoutSubviews {
    [super layoutSubviews];
    CGSize imageSize = CGSizeEqualToSize(self.fixedImageSize, CGSizeZero)? self.imageView.frame.size : self.fixedImageSize;
    CGFloat width = CGRectGetWidth(self.bounds);
    CGFloat height = CGRectGetHeight(self.bounds);
    [self.imageView setFrame:({
        CGRect frame = self.imageView.frame;
        frame.size = imageSize;
        frame;
    })];
    CGSize titleLabelSize = self.titleLabel.intrinsicContentSize;
    if (_fixedLabelWidth > 0) {
        titleLabelSize.width = _fixedLabelWidth;
    }
    [self.titleLabel setBounds:({
        CGRect bounds = self.titleLabel.bounds;
        bounds.size = titleLabelSize;
        bounds;
    })];
    switch (_layout) {
        case WLUIButtonLayoutTitleLeftImageRight:
        {
            CGFloat titleLeft = (width - (titleLabelSize.width + imageSize.width + _titleImageSpacing))/2;
            self.titleLabel.frame = ({
                CGRect frame = self.titleLabel.frame;
                frame.origin.x = titleLeft;
                frame.origin.y = (height - CGRectGetHeight(frame))/2;
                frame;
            });
            self.imageView.frame = ({
                CGRect frame = self.imageView.frame;
                frame.origin.x = CGRectGetMaxX(self.titleLabel.frame) + _titleImageSpacing;
                frame.origin.y = (height - CGRectGetHeight(frame))/2;
                frame;
            });
        }
            break;
        case WLUIButtonLayoutImageLeftTitleRight:
        {
            CGFloat imageLeft = (width - (titleLabelSize.width + imageSize.width + _titleImageSpacing))/2;
            self.imageView.frame = ({
                CGRect frame = self.imageView.frame;
                frame.origin.x = imageLeft;
                frame.origin.y = (height - CGRectGetHeight(frame))/2;
                frame;
            });
            self.titleLabel.frame = ({
                CGRect frame = self.titleLabel.frame;
                frame.origin.x = CGRectGetMaxX(self.imageView.frame) + _titleImageSpacing;
                frame.origin.y = (height - CGRectGetHeight(frame))/2;
                frame;
            });
        }
            break;
            
        case WLUIButtonLayoutTitleTopImageBottom:
        {
            CGFloat titleTop = (height - (titleLabelSize.height + imageSize.height + _titleImageSpacing))/2;
            self.titleLabel.frame = ({
                CGRect frame = self.titleLabel.frame;
                frame.origin.x =  (width - CGRectGetWidth(frame))/2;
                frame.origin.y = titleTop;
                frame;
            });
            self.imageView.frame = ({
                CGRect frame = self.imageView.frame;
                frame.origin.x = (width - CGRectGetWidth(frame))/2;
                frame.origin.y = CGRectGetMaxY(self.titleLabel.frame) + _titleImageSpacing;
                frame;
            });
        }
            break;
        case WLUIButtonLayoutImageTopTitleBottom:
        {
            CGFloat imageTop = (height - (titleLabelSize.height + imageSize.height + _titleImageSpacing))/2;
            self.imageView.frame = ({
                CGRect frame = self.imageView.frame;
                frame.origin.x =  (width - CGRectGetWidth(frame))/2;
                frame.origin.y = imageTop;
                frame;
            });
            self.titleLabel.frame = ({
                CGRect frame = self.titleLabel.frame;
                frame.origin.x = (width - CGRectGetWidth(frame))/2;
                frame.origin.y = CGRectGetMaxY(self.imageView.frame) + _titleImageSpacing;
                frame;
            });
        }
            break;
    }
    
    self.titleLabel.center = ({
        CGPoint center = self.titleLabel.center;
        center.x += _contentCenterXOffset;
        center.y += _contentCenterYOffset;
        center;
    });
    self.imageView.center = ({
        CGPoint center = self.imageView.center;
        center.x += _contentCenterXOffset;
        center.y += _contentCenterYOffset;
        center;
    });
}

@end
