//
//  AppDelegate.m
//  GF_Chat
//
//  Created by GaoFei on 16/5/18.
//  Copyright © 2016年 YF_S. All rights reserved.
//

#import "AppDelegate.h"

#import "XMTabBarController.h"//标签控制器
#import "ViewController.h"
#import "FirstViewController.h"

@interface AppDelegate (){

    BOOL isFirstLoad;
}

@end

@implementation AppDelegate

/**设置主视图控制器*/
-(void)loadCreateRootViewController{

    //2. 首次加载时调用
    isFirstLoad = [DEFAULTS boolForKey:@"isFirstLoad"];
    
    if (!isFirstLoad) {
        
        FirstViewController *firstVC = [[FirstViewController alloc]init];
        self.window.rootViewController = firstVC;
        //第一次加载后重新赋值
        [DEFAULTS setBool:YES forKey:@"isFirstLoad"];
        
    }else{
        
        //获取到默认的用户
        //登录
        NSString *userName = [DEFAULTS objectForKey:@"userName"];
        NSString *password = [DEFAULTS objectForKey:@"userPwd"];
        
        if (userName.length && password.length) {
            
            if ([userName isEqualToString:@"gaofei"] && [password isEqualToString:@"gaofei"]) {
                
                //保存默认用户
                [DEFAULTS setObject:userName forKey:@"userName"];
                [DEFAULTS setObject:password forKey:@"userPwd"];
                
                [self loadAllViewController];
            }else{
                
                [MBProgressHUD showError:@"用户名或密码错误" toView:self.window];
                
                UIStoryboard * storyboard = [UIStoryboard storyboardWithName:@"LogInViewController" bundle:nil];
                
                UINavigationController * nav = [storyboard instantiateInitialViewController];
                
                self.window.rootViewController = nav;
                
            }
        }else{
            
            
            UIStoryboard * storyboard = [UIStoryboard storyboardWithName:@"LogInViewController" bundle:nil];
            
            UINavigationController * nav = [storyboard instantiateInitialViewController];
            
            self.window.rootViewController = nav;
            
        }
    }
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
//1. 创建窗口
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    //设置窗口颜色
    self.window.backgroundColor = [UIColor whiteColor];
    
    //设置窗口为主窗口并且显示
    [self.window makeKeyAndVisible];
    
//2. 设置主视图控制器
    [self loadCreateRootViewController];
    
    return YES;
}

//加载所有的视图控制器
-(void)loadAllViewController{

    //创建装加载完成的视图控制器 [UIImage imageNamed:@"tab1_chat_on"],
    NSMutableArray * addArrName = [NSMutableArray new];
    
    //2.创建各个视图控制器
    //2.1视图控制器的名称 @"OnlineChatViewController",
    NSArray * sbArrName = @[@"ChatViewController",
                            @"ContactViewController",
                            @"FoundViewController",
                            @"MyInfoViewController",
                            @"SettingViewController",];
    
    //2.2视图控制器选中时的图片
    NSMutableArray * selecedImgArr = [[NSMutableArray alloc] initWithObjects:[UIImage imageNamed:@"tab1_chat_on"],
                                      [UIImage imageNamed:@"tab4_function_on"],
                                      [UIImage imageNamed:@"tab3_crm_on"],
                                      [UIImage imageNamed:@"tab2_work_on"],
                                      [UIImage imageNamed:@"tab5_my_on"],nil];
    
    //2.3视图控制器未选中时的图片 [UIImage imageNamed:@"tab1_chat_off"],
    NSMutableArray * normalImgArr = [[NSMutableArray alloc] initWithObjects:[UIImage imageNamed:@"tab1_chat_off"],
                                     [UIImage imageNamed:@"tab4_function_off"],
                                     [UIImage imageNamed:@"tab3_crm_off"],
                                     [UIImage imageNamed:@"tab2_work_off"],
                                     [UIImage imageNamed:@"tab5_my_off"],nil];
    
    //2.4视图控制器的名称  @"企信",
    NSMutableArray * vcNameArr = [[NSMutableArray alloc] initWithObjects:@"企信",
                                  @"联系人",
                                  @"发现",
                                  @"我的",
                                  @"设置",nil];
    
    //2.5使用for in 循环来加载视图控制器
    for (NSString * name in sbArrName) {
        
        //使用UIStoryboard加载
        UIStoryboard * sb = [UIStoryboard storyboardWithName:name bundle:nil];
        
        UINavigationController * nav = [sb instantiateInitialViewController];
        
        [addArrName addObject:nav];
    }
    
    //2.6初始化TabBar
    XMTabBarController * tabBar = [[XMTabBarController alloc] initWithTabBarSelectedImages:selecedImgArr normalImages:normalImgArr titles:vcNameArr];
    
    //设置中间的按钮隐藏
    tabBar.showCenterItem = NO;
    
    //设置选中时的颜色
    tabBar.textColor = RGB_Alpha(253, 191, 0, 1.0);
    
    //将视图控制器给TabBar
    tabBar.viewControllers = addArrName;
    
    //设置窗口的主视图控制器
    self.window.rootViewController = tabBar;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
