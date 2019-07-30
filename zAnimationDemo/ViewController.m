//
//  ViewController.m
//  zAnimationDemo
//
//  Created by ZhangYaoHua on 2019/7/30.
//  Copyright © 2019 ZYH. All rights reserved.
//

#import "ViewController.h"
#import "zTripeViewSwitchViewController.h"

static NSString *animationDemoCellID = @"animationDemoCellID";

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *animationTableView;

@property (nonatomic, copy) NSArray *animations;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"动画demo";
    
    [self initView];
}

- (void)initView
{
    _animationTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _animationTableView.delegate = self;
    _animationTableView.dataSource = self;
    _animationTableView.rowHeight = 50;
    
    Class cellClass = [UITableViewCell class];
    [_animationTableView registerClass:cellClass forCellReuseIdentifier:animationDemoCellID];
    
    [self.view addSubview:self.animationTableView];
}

- (NSArray *)animations
{
    if (!_animations) {
        _animations = @[@"三个View切换"];
    }
    return _animations;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.animations.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:animationDemoCellID forIndexPath:indexPath];
    cell.textLabel.text = self.animations[indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *demoTitle = self.animations[indexPath.row];
    if ([demoTitle isEqualToString:@"三个View切换"]) {
        zTripeViewSwitchViewController *dstVC = [[zTripeViewSwitchViewController alloc] init];
        [self.navigationController pushViewController:dstVC animated:YES];
    }
}

@end
