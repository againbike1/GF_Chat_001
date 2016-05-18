//
//  BasePushViewController.m
//  GF_Chat
//
//  Created by GaoFei on 16/5/18.
//  Copyright © 2016年 YF_S. All rights reserved.
//

#import "BasePushViewController.h"

@interface BasePushViewController ()

@end

@implementation BasePushViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

//试图将要加载时调用
-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    [(XMTabBarController *)self.tabBarController xmTabBarHidden:YES animated:YES];
}

-(void)endEditView:(UIView *)endEditView{
    
    //设置轻击
    UITapGestureRecognizer * tapGR = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(bgScrollViewEndEditing:)];
    
    tapGR.numberOfTapsRequired = 1;
    
    //设置触摸点数 默认为1
    tapGR.numberOfTouchesRequired = 1;
    
    //添加单击手势
    [endEditView addGestureRecognizer:tapGR];
}

//轻击的点击相应事件
-(void)bgScrollViewEndEditing:(UITapGestureRecognizer *)tap{
    
    if (tap.numberOfTapsRequired == 1) {
        
        [self.view endEditing:YES];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
