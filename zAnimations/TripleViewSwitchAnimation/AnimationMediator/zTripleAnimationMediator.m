//
//  zTripleAnimationMediator.m
//  zAnimationDemo
//
//  Created by ZhangYaoHua on 2019/7/30.
//  Copyright © 2019 ZYH. All rights reserved.
//

#import "zTripleAnimationMediator.h"

@interface zTripleAnimationMediator ()

@property (nonatomic, strong) zTripleAnimationParam *leftAnimationParam;
@property (nonatomic, strong) zTripleAnimationParam *centerAnimationParam;
@property (nonatomic, strong) zTripleAnimationParam *rightAnimationParam;

@end

@implementation zTripleAnimationMediator

- (instancetype)init
{
    if (self = [super init]) {
        _centerAnimationParam = [[zTripleAnimationParam alloc] init];
        _centerAnimationParam.transform = CGAffineTransformMakeScale(1.0f, 1.0f);
        _centerAnimationParam.alpha = 1.0f;
        CGSize screenSize = [UIScreen mainScreen].bounds.size;
        _centerAnimationParam.center = CGPointMake(screenSize.width/2.0, screenSize.height/2.0f);
        
        _leftAnimationParam = [[zTripleAnimationParam alloc] init];
        _leftAnimationParam.transform = CGAffineTransformMakeScale(0.7, 0.7);
        _leftAnimationParam.alpha = 0.45;
        _leftAnimationParam.center = CGPointMake(_centerAnimationParam.center.x - 116, _centerAnimationParam.center.y);
        
        _rightAnimationParam = [[zTripleAnimationParam alloc] init];
        _rightAnimationParam.transform = _leftAnimationParam.transform;
        _rightAnimationParam.alpha = _leftAnimationParam.alpha;
        _rightAnimationParam.center = CGPointMake(_centerAnimationParam.center.x + 116, _centerAnimationParam.center.y);
    }
    return self;
}

- (void)startSwitchAnimation
{
    self.centerView.alpha = self.centerAnimationParam.alpha;
    
    [UIView animateWithDuration:1.0f animations:^{
        self.leftView.animationParam = self.leftAnimationParam;
        self.centerView.animationParam = self.centerAnimationParam;
        self.rightView.animationParam = self.rightAnimationParam;
    }];
}

- (void)updateCenterView:(zTripleSwitchView *)newCenterView
{
    if ([newCenterView isEqual:self.centerView]) {
        return;
    }
    
    if ([newCenterView isEqual:self.leftView]) {
        zTripleSwitchView *tempRightView = self.rightView;
        self.rightView = self.centerView;
        self.centerView = self.leftView;
        self.leftView = tempRightView;
    }
    else if ([newCenterView isEqual:self.rightView]) {
        zTripleSwitchView *tempLeftView = self.leftView;
        self.leftView = self.centerView;
        self.centerView = self.rightView;
        self.rightView = tempLeftView;
    }
    
    [self.centerView.superview bringSubviewToFront:self.centerView];
    
    [self startSwitchAnimation];
}

@end
