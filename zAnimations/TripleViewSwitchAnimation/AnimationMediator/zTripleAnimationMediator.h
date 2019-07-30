//
//  zTripleAnimationMediator.h
//  zAnimationDemo
//
//  Created by ZhangYaoHua on 2019/7/30.
//  Copyright © 2019 ZYH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "zTripleAnimationParam.h"
#import "zTripleSwitchView.h"

NS_ASSUME_NONNULL_BEGIN

@interface zTripleAnimationMediator : NSObject

@property (nonatomic, strong, readonly) zTripleAnimationParam *leftAnimationParam;
@property (nonatomic, strong, readonly) zTripleAnimationParam *centerAnimationParam;
@property (nonatomic, strong, readonly) zTripleAnimationParam *rightAnimationParam;

@property (nonatomic, strong) zTripleSwitchView *leftView;
@property (nonatomic, strong) zTripleSwitchView *centerView;
@property (nonatomic, strong) zTripleSwitchView *rightView;

- (void)startSwitchAnimation;
- (void)updateCenterView:(zTripleSwitchView *)newCenterView;

@end

NS_ASSUME_NONNULL_END
