//
//  zTripleSwitchView.m
//  zAnimationDemo
//
//  Created by ZhangYaoHua on 2019/7/30.
//  Copyright © 2019 ZYH. All rights reserved.
//

#import "zTripleSwitchView.h"

@implementation zTripleSwitchView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        _hintLbl = [UILabel new];
        _hintLbl.font = [UIFont systemFontOfSize:50 weight:UIFontWeightBold];
        _hintLbl.textColor = [UIColor blackColor];
        _hintLbl.textAlignment = NSTextAlignmentCenter;
        _hintLbl.frame = self.bounds;
        [self addSubview:_hintLbl];
        
        _actionBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:_actionBtn];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.hintLbl.frame = self.bounds;
    self.actionBtn.frame = self.bounds;
}

- (void)setAnimationParam:(zTripleAnimationParam *)animationParam
{
    self.transform = animationParam.transform;
    self.alpha = animationParam.alpha;
    self.center = animationParam.center;
}

@end
