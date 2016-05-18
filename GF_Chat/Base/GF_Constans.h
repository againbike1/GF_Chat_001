//
//  GF_Constans.h
//  GF_Chat
//
//  Created by GaoFei on 16/5/18.
//  Copyright © 2016年 YF_S. All rights reserved.
//

#ifndef GF_Constans_h
#define GF_Constans_h

//
#import "GF_Constans_Color.h"
#import "GF_Constans_Size.h"
#import "GF_Constans_Font.h"


//存储数据
#define DEFAULTS [NSUserDefaults standardUserDefaults]

//Appdelegate
#define ShareApplicationDelegate [UIApplication sharedApplication].delegate

//Storyboard
#define UISTORYBOARD(a) [UIStoryboard storyboardWithName:a bundle:nil]

#define Key_DistrictSelectProvince          @"DistrictSelectProvince"
#define Key_DistrictSelectProvinceCode      @"DistrictSelectProvinceCode"
#define Key_DistrictSelectProvinceSubCode   @"DistrictSelectProvinceSubCode"
#define Key_DistrictSelectProvinceSub       @"DistrictSelectProvinceSub"
#define Key_DistrictSelectCityCode          @"DistrictSelectCityCode"
#define Key_DistrictSelectCity              @"DistrictSelectCity"

#define Error_Bad_Net @"您的操作无法完成,请在网络畅通网速良好的环境下重新操作"

//拼接字符串
#define $str(...)   [NSString stringWithFormat:__VA_ARGS__]
#define IOS [[[UIDevice currentDevice] systemVersion] floatValue]

#define IOS7 ( IOS >= 7.0)
#define IOS8 ( IOS >= 8.0)
#define IOS9 ( IOS >= 9.0)
#define IOS4 (IOS < 5.0)

#endif /* GF_Constans_h */
