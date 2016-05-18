//
//  LogInViewController.m
//  GF_Chat
//
//  Created by GaoFei on 16/5/18.
//  Copyright © 2016年 YF_S. All rights reserved.
//

/**
 模拟账号是：gaofei 密码是：gaofei

 */


#import "LogInViewController.h"
#import "RegisterNowViewController.h"
#import "RetrievePasswordViewController.h"

@interface LogInViewController ()

@property (strong, nonatomic) IBOutlet UITextField *userNameTextfield;
@property (strong, nonatomic) IBOutlet UIImageView *logoImageView;
@property (strong, nonatomic) IBOutlet UITextField *passWordTextField;
@property (strong, nonatomic) IBOutlet UIImageView *loginBgImg;

//收起打开键盘的约束条件
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *NormalLayoutContraint;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *ShowLayoutContraint;


@end

@implementation LogInViewController

//输入密码或者用户名时键盘的收起与打开
// 显示键盘
- (void)keyBoardwillShow:(NSNotification *)notification{
    
    self.NormalLayoutContraint.priority = UILayoutPriorityDefaultLow;
    
    self.ShowLayoutContraint.priority = UILayoutPriorityDefaultHigh;
    
    
    [UIView animateWithDuration:0.25f animations:^{
        
        [self.view layoutIfNeeded];
        
    }];
}
// 关闭键盘
- (void)keyBoardwillHide:(NSNotification *)notification{
    
    self.NormalLayoutContraint.priority = UILayoutPriorityDefaultHigh;
    
    self.ShowLayoutContraint.priority = UILayoutPriorityDefaultLow;
    
    
    //    添加一个动画，避免生硬的效果
    [UIView animateWithDuration:0.25f animations:^{
        
        [self.view layoutIfNeeded];
        
    }];
    
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

//设置登录界面的飞入状态
-(void)loadViewJieMian{
    
    self.loginBgImg.image = [UIImage imageNamed:@"BgImage"];
    
    self.logoImageView.frame = CGRectMake((self.loginBgImg.bounds.size.width - 100)/2, 80, 100, 100);
    self.logoImageView.image = [UIImage imageNamed:@"usrIcon"];
    
    self.userNameTextfield.frame = CGRectMake(DeviceWidth, self.logoImageView.frame.origin.y + self.logoImageView.bounds.size.height + 30, DeviceWidth - 60, 40);
    self.passWordTextField.frame = CGRectMake(-DeviceWidth, self.userNameTextfield.frame.origin.y + self.userNameTextfield.bounds.size.height, DeviceWidth - 60, 40);
    
    UIView *emailLeftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.userNameTextfield.bounds.size.height, self.userNameTextfield.bounds.size.height)];
    UIImageView *eleftImg = [[UIImageView alloc]initWithFrame:CGRectMake(4, 4, 32, 32)];
    eleftImg.image = [UIImage imageNamed:@"user"];
    [emailLeftView addSubview:eleftImg];
    self.userNameTextfield.leftView = emailLeftView;
    self.userNameTextfield.leftViewMode = UITextFieldViewModeAlways;
    
    UIView *pwdLeftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.passWordTextField.bounds.size.height, self.passWordTextField.bounds.size.height)];
    UIImageView *pleftImg = [[UIImageView alloc]initWithFrame:CGRectMake(4, 4, 32, 32)];
    pleftImg.image = [UIImage imageNamed:@"pwd"];
    [pwdLeftView addSubview:pleftImg];
    self.passWordTextField.leftView = pwdLeftView;
    self.passWordTextField.leftViewMode = UITextFieldViewModeAlways;
    
    //设置text输入框有动画效果的飞入
    [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseInOut  animations:^{
        self.userNameTextfield.frame = CGRectMake(30, self.logoImageView.frame.origin.y + self.logoImageView.bounds.size.height + 30, DeviceWidth - 60, 40);
    } completion:nil];
    CGAffineTransform rotation = CGAffineTransformMakeRotation(M_PI);
    [UIView animateWithDuration:0.5 delay:0.3 options:UIViewAnimationOptionCurveLinear animations:^{
        self.passWordTextField.frame = CGRectMake(30, self.userNameTextfield.frame.origin.y + self.userNameTextfield.bounds.size.height, DeviceWidth - 60, 40);
        self.logoImageView.transform = rotation;
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:.5 animations:^{
            
            self.logoImageView.transform = CGAffineTransformIdentity;
        }];
    }];
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //创建打开键盘的收起与打开的通知
    //创建通知
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyBoardwillShow:) name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyBoardwillHide:) name:UIKeyboardWillHideNotification object:nil];
    
    //设置登录界面
    [self loadViewJieMian];
    
    //尝试登录
    [self loadTryUserAndPassword];
}

//尝试的进行登录
-(void)loadTryUserAndPassword{
    
    BOOL shouldAutoLogin = YES;
    NSString *userName = [self getDefaultUserName];
    NSString *password = nil;
    if (userName) {
        
        password = [self getDefaultUserPwd];
    }else{
        
        shouldAutoLogin = NO;
    }
    
    if (![self getDefaultUser]) {
        
        shouldAutoLogin = NO;
    }
    
    //设置用户名及密码
    self.userNameTextfield.text = [self getDefaultUserName];
    self.passWordTextField.text = [self getDefaultUserPwd];
}

- (BOOL)textFieldShouldClear:(UITextField *)textField{
    
    if (textField.tag == 1001) {
        
        self.passWordTextField.text = @"";
    }
    
    return YES;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    if (textField.tag == 1001) {
        
        self.passWordTextField.text = @"";
    }
    
    return YES;
}

/**
 *  获取默认用户
 *
 *  @return 是否获取到数据
 */
- (BOOL)getDefaultUser{
    NSString* userName = [[NSUserDefaults standardUserDefaults] objectForKey:@"userName"];
    NSString* userPwd = [[NSUserDefaults standardUserDefaults] objectForKey:@"userPwd"];
    return userName && userPwd;
}
/*获取用户账号*/
- (NSString*)getDefaultUserName{
    
    NSString* defaultUser = [[NSUserDefaults standardUserDefaults] objectForKey:@"userName"];
    return defaultUser;
}

/*获取用户密码*/
- (NSString*)getDefaultUserPwd{
    NSString* defaultUserPwd = [[NSUserDefaults standardUserDefaults] objectForKey:@"userPwd"];
    return defaultUserPwd;
}


/**登录*/
- (IBAction)logInBtnAct:(id)sender {

    [self.view endEditing:YES];
    
    NSString * userName = self.userNameTextfield.text;
    NSString* userPwd = self.passWordTextField.text;
    [self login:userName password:userPwd];
}

//-(void) defaultLogin;
- (void)login:(NSString *)userName password:(NSString *)password{

    if ([self validateUserName:userName userPwd:password]) {
        
        [DEFAULTS removeObjectForKey :@"UserCookies"];
        
        if ([userName isEqualToString:@"gaofei"] && [password isEqualToString:@"gaofei"]) {
            
            //登录成功后调用下面的接口  用来存储默认用户
            [self loginSuccess:userName password:password token:nil userId:nil];
        }else{
        
            [MBProgressHUD showError:@"用户名或密码错误" toView:self.view];
        }
    }
}

//登陆成功
- (void)loginSuccess:(NSString *)userName password:(NSString *)password token:(NSString *)token userId:(NSString *)userId{
    //保存默认用户
    [DEFAULTS setObject:userName forKey:@"userName"];
    [DEFAULTS setObject:password forKey:@"userPwd"];
    [DEFAULTS setObject:token forKey:@"userToken"];
    [DEFAULTS setObject:userId forKey:@"userId"];
    
    [(AppDelegate *)ShareApplicationDelegate loadAllViewController];
}

//验证用户信息格式
- (BOOL)validateUserName:(NSString*)userName
                 userPwd:(NSString*)userPwd{
    if (userName.length == 0) {
        
        [MBProgressHUD showError:@"用户名不能为空!" toView:self.view];
        
        [self.userNameTextfield becomeFirstResponder];
        
        return NO;
        
    }
    else if (userPwd.length == 0) {
        [MBProgressHUD showError:@"密码不能为空!" toView:self.view];
        
        [self.passWordTextField becomeFirstResponder];
        
        return NO;
    }
    
    return YES;
}


/**立即注册*/
- (IBAction)registerNowBtnAct:(id)sender {

    RegisterNowViewController * registervc = [UISTORYBOARD(@"LogInViewController") instantiateViewControllerWithIdentifier:@"RegisterNowViewController"];
    
    [self.navigationController pushViewController:registervc animated:YES];
}

/**忘记密码*/
- (IBAction)retrievePasswordBtnAct:(id)sender {

    RetrievePasswordViewController * retrievevc = [UISTORYBOARD(@"LogInViewController") instantiateViewControllerWithIdentifier:@"RetrievePasswordViewController"];
    
    [self.navigationController pushViewController:retrievevc animated:YES];

}

/**关闭键盘*/
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    [super touchesEnded:touches withEvent:event];
    
    [self.view endEditing:YES];
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
