//
//  GF_Constans_Size.h
//  GF_Chat
//
//  Created by GaoFei on 16/5/18.
//  Copyright © 2016年 YF_S. All rights reserved.
//

#ifndef GF_Constans_Size_h
#define GF_Constans_Size_h


//屏幕大小
#define DefaultPageSize         10
#define DefaultPlatform         [NSNumber numberWithInt:1]
#define DefaultSystemVersion    [[UIDevice currentDevice]systemVersion]
#define DeviceHeight            [[UIScreen mainScreen] bounds].size.height
#define DeviceWidth             [[UIScreen mainScreen] bounds].size.width

#define AutoSizeScaleX          [[UIScreen mainScreen] bounds].size.width/320.0
#define AutoSizeScaleY          [[UIScreen mainScreen] bounds].size.height/568.0


#define NavStateBarHight (20)
#define NavBarHight (44)
#define NavBarAndStateBarHight (NavStateBarHight + NavBarHight)


//视图尺寸
#define WIDTH(view) view.frame.size.width
#define HEIGHT(view) view.frame.size.height
#define IMGWIDTH(image) image.size.width
#define IMGHEIGHT(image) image.size.height
#define X(view) view.frame.origin.x
#define Y(view) view.frame.origin.y

#define MaxX(view) CGRectGetMaxX(view.frame)
#define MaxY(view) CGRectGetMaxY(view.frame)

#define MaxScreenX CGRectGetWidth([UIScreen mainScreen].bounds)
#define MaxScreenY CGRectGetHeight([UIScreen mainScreen].bounds)

#define LEFT(view) view.frame.origin.x
#define TOP(view) view.frame.origin.y
#define BOTTOM(view) (view.frame.origin.y + view.frame.size.height)
#define RIGHT(view) (view.frame.origin.x + view.frame.size.width)



#endif /* GF_Constans_Size_h */
