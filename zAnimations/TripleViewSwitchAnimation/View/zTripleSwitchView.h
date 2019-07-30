//
//  zTripleSwitchView.h
//  zAnimationDemo
//
//  Created by ZhangYaoHua on 2019/7/30.
//  Copyright © 2019 ZYH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "zTripleAnimationParam.h"

NS_ASSUME_NONNULL_BEGIN

@interface zTripleSwitchView : UIView

@property (nonatomic, strong) UILabel *hintLbl;
@property (nonatomic, strong) UIButton *actionBtn;
@property (nonatomic, strong) zTripleAnimationParam *animationParam;

@end

NS_ASSUME_NONNULL_END
