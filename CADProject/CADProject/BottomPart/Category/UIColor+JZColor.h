//
//  UIColor+PEColor.h
//  PercetIn
//
//  Created by Keven on 2018/8/7.
//  Copyright © 2018年 Keven. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIColor (JZColor)

+ (UIColor *)C_8195A5;
+ (UIColor *)C_101D34;
+ (UIColor *)C_F1F5F8;
	/// RGBA 创建带透明度的颜色
	/// @param r r description
	/// @param g g description
	/// @param b b description
	/// @param A A description
+ (UIColor *)ColorAlphaWithR:(CGFloat)r G:(CGFloat)g B:(CGFloat)b A:(CGFloat)A;
+ (UIColor *)C_C8C8C8;
+ (UIColor *)C_D8D8D8;
+ (UIColor *)C_F3F3F4;
	/// 字体颜色 黑色
+ (UIColor *)C_222222;
	/// 字体颜色 灰色
+ (UIColor *)C_444444;
+ (UIColor *)C_666666;
	/// 字体颜色 浅灰
+ (UIColor *)C_999999;
    ///
+ (UIColor *)C_AAAAAA;

+ (UIColor *)C_333333;
// 灰色字体颜色
- (UIColor *)C_C8C8C8;
+ (UIColor *)C_111111;
	/// 线的颜色
+ (UIColor *)C_EEEEEE;
+ (UIColor *)C_F7F7F7;
+ (UIColor *)C_DDDDDD;
+ (UIColor *)C_F6F7FB;
+ (UIColor *)C_A9ACB4;
+ (UIColor *)C_FFA450;
/// view背景颜色
+ (UIColor *)C_ViewBackgroundColor;

	/// 地图的背景颜色
+ (UIColor *)C_MapViewBackgroundColor;
/// 白色（黑金）/黑色(普通)字体颜色
+ (UIColor *)C_TextColor;

/// 有背景色的按钮字体颜色
+ (UIColor *)C_BtnColor;
/// 弹框背景色
+ (UIColor *)C_313131;
/// 清洁面积 时间 字体颜色
+ (UIColor *)C_163163163;
/// 导航栏颜色
+ (UIColor *)C_202020;
/// 离线颜色
+ (UIColor *)C_929292;

/// 在线颜色 金色
+ (UIColor *)C_D8AE60;

+ (UIColor *)C_lineColor;
/**
 color 54A935 绿色
 */
+(UIColor *)C_baseGreen;

/**
 color 9dca8c 浅绿色
 */
+(UIColor *)C_baseLightGreen;
/**
 color 54A935 绿色
 */
+(UIColor *)C_54A935;

/**
 color 9dca8c 浅绿色
 */
+(UIColor *)C_9dca8c;
/**
 color CACACA 线的颜色
 */
+(UIColor *)C_CACACA;
/**
 color 525356 灰色 字体的颜色
 */
+(UIColor *)C_525356;
/**
 color C_128 灰色 字体的颜色
 */
+(UIColor *)C_128;
/**
 color 252525 黑色 字体的颜色
 */
+(UIColor *)C_252525;

/**
 color C_F6F6F6 view灰色背景色
 */
+(UIColor *)C_F6F6F6;

/**
 color e7e7e7 浅灰色
 */
+(UIColor *)C_e7e7e7;
/**
 color FF0101 红色
 */
+(UIColor *)C_FF0101;
/**
 color C_FA7272 浅红色
 */
+(UIColor *)C_FA7272;
/**
 color FF5B5F
 */
+(UIColor *)FF5B5F;
/**
 color 0E9981
 */
+(UIColor *)C_0E9981;

/**
 color E83434
 */
+(UIColor *)C_E83434;
/**
 color F6A6A6
 */
+(UIColor *)C_F6A6A6;

+(UIColor *) hexStringToColor: (NSString *) stringToConvert;
+(UIColor *) hexStringToColor: (NSString *) stringToConvert alpha:(CGFloat)alpha;
+(NSArray *) hexStringToRGB: (NSString *) stringToConvert;
@end
