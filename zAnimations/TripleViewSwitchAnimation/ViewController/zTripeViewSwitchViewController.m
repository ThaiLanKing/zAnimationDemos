//
//  zTripeViewSwitchViewController.m
//  zAnimationDemo
//
//  Created by ZhangYaoHua on 2019/7/30.
//  Copyright © 2019 ZYH. All rights reserved.
//

#import "zTripeViewSwitchViewController.h"
#import "zTripleSwitchView.h"
#import "zTripleAnimationMediator.h"

@interface zTripeViewSwitchViewController ()

@property (nonatomic, strong) zTripleSwitchView *redView;
@property (nonatomic, strong) zTripleSwitchView *greenView;
@property (nonatomic, strong) zTripleSwitchView *blueView;

@property (nonatomic, strong) zTripleAnimationMediator *animationMediator;

@end

@implementation zTripeViewSwitchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self initView];
}

- (void)initView
{
    [self.view addSubview:self.redView];
    [self.view addSubview:self.greenView];
    [self.view addSubview:self.blueView];
    
    CGFloat viewSize = 230;
    self.redView.frame = CGRectMake(0, 0, viewSize, viewSize);
    self.greenView.frame = self.redView.frame;
    self.blueView.frame = self.redView.frame;
    
    self.redView.layer.cornerRadius = viewSize/2.0f;
    self.greenView.layer.cornerRadius = viewSize/2.0f;
    self.blueView.layer.cornerRadius = viewSize/2.0f;
    
    
    self.redView.animationParam = self.animationMediator.leftAnimationParam;
    self.greenView.animationParam = self.animationMediator.centerAnimationParam;
    self.blueView.animationParam = self.animationMediator.rightAnimationParam;
    
    self.animationMediator.leftView = self.redView;
    self.animationMediator.centerView = self.greenView;
    self.animationMediator.rightView = self.blueView;
    
    [self.view bringSubviewToFront:self.animationMediator.centerView];
}

#pragma mark - View

- (zTripleSwitchView *)redView
{
    if (!_redView) {
        _redView = [[zTripleSwitchView alloc] init];
        _redView.backgroundColor = [UIColor redColor];
        _redView.hintLbl.text = @"1";
        [_redView.actionBtn addTarget:self action:@selector(switchViewTapped:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _redView;
}

- (zTripleSwitchView *)greenView
{
    if (!_greenView) {
        _greenView = [[zTripleSwitchView alloc] init];
        _greenView.backgroundColor = [UIColor greenColor];
        _greenView.hintLbl.text = @"2";
        [_greenView.actionBtn addTarget:self action:@selector(switchViewTapped:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _greenView;
}

- (zTripleSwitchView *)blueView
{
    if (!_blueView) {
        _blueView = [[zTripleSwitchView alloc] init];
        _blueView.backgroundColor = [UIColor blueColor];
        _blueView.hintLbl.text = @"3";
        [_blueView.actionBtn addTarget:self action:@selector(switchViewTapped:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _blueView;
}

#pragma mark -

- (zTripleAnimationMediator *)animationMediator
{
    if (!_animationMediator) {
        _animationMediator = [zTripleAnimationMediator new];
    }
    return _animationMediator;
}

- (void)switchViewTapped:(UIButton *)sender
{
    [self.animationMediator updateCenterView:(id)sender.superview];
}

@end
