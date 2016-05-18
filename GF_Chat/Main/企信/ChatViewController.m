//
//  ChatViewController.m
//  GF_Chat
//
//  Created by GaoFei on 16/5/18.
//  Copyright © 2016年 YF_S. All rights reserved.
//

#import "ChatViewController.h"
#import "MoNiPushViewController.h"

@interface ChatViewController ()

@end

@implementation ChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"企信";
}

- (IBAction)pushBtnAct:(id)sender {

    MoNiPushViewController * psuh = [[MoNiPushViewController alloc] init];
    
    [self.navigationController pushViewController:psuh animated:YES];
}


-(void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:animated];
    
    [(XMTabBarController *)self.tabBarController xmTabBarHidden:NO animated:YES];
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
