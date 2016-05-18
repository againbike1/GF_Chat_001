//
//  FirstViewController.m
//  one
//
//  Created by 新视界公司 on 16/5/11.
//  Copyright © 2016年 新视界公司. All rights reserved.
//

#import "FirstViewController.h"
#import "AppDelegate.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //创建scrollView
    [self scrollView];
    
    
}

-(void)scrollView{
    
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:self.view.bounds];
    
    //设置内容尺寸
    scrollView.contentSize = CGSizeMake(DeviceWidth *4, DeviceHeight-20);
    
    //循环
    for (int i = 0; i< 4; i++) {
        
        UIImageView *imgV = [[UIImageView alloc]initWithFrame:CGRectMake(i*DeviceWidth, 0, DeviceWidth, DeviceHeight)];
        
        imgV.image = [UIImage imageNamed:[NSString stringWithFormat:@"first0%d",i+1]];
        
        [scrollView addSubview:imgV];
        
        //判断是否为第三个imgV  如果是则添加按钮
        if (i == 3) {
            UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(DeviceWidth*220/375, DeviceHeight*560/667, DeviceWidth*120/375, DeviceHeight*40/667)];
            
            btn.backgroundColor = [UIColor clearColor];
            
            [btn addTarget:self action:@selector(btnAct:) forControlEvents:UIControlEventTouchUpInside];
            
            //设置imgV的触摸响应
            imgV.userInteractionEnabled = YES;
            
            [imgV addSubview:btn];
            
        }
        
    }
    
   //设置分页效果
    scrollView.pagingEnabled = YES;
    
    //添加scrollView
    [self.view addSubview:scrollView];
    
}

//按钮点击方法
-(void)btnAct:(UIButton *)btn{
    
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    
    //加载标签控制器
    [appDelegate loadAllViewController];
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
