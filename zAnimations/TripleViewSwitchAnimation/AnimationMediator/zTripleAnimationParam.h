//
//  zTripleAnimationParam.h
//  zAnimationDemo
//
//  Created by ZhangYaoHua on 2019/7/30.
//  Copyright © 2019 ZYH. All rights reserved.
//

#import <Foundation/Foundation.h>

@import CoreGraphics;

NS_ASSUME_NONNULL_BEGIN

@interface zTripleAnimationParam : NSObject

@property (nonatomic, assign) CGAffineTransform transform;
@property (nonatomic, assign) CGFloat alpha;
@property (nonatomic, assign) CGPoint center;

@end

NS_ASSUME_NONNULL_END
