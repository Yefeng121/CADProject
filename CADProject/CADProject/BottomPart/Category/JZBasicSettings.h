//
//  PEBasicSettings.h
//  PercetIn
//
//  Created by Keven on 2018/7/18.
//  Copyright © 2018年 Keven. All rights reserved.
//

#import <Foundation/Foundation.h>

//Log
#define HTTPLog_ON NO
#define OtherLog_ON NO

#define         IOS_VERSION_7_0_LATER [[UIDevice currentDevice].systemVersion floatValue] >= 7.0

#define         IOS_VERSION_8_0_LATER [[UIDevice currentDevice].systemVersion floatValue] >= 8.0

#define         IOS_VERSION_9_0_LATER [[UIDevice currentDevice].systemVersion floatValue] >= 9.0

//获取屏幕宽高
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

// 缩放尺寸
#define SCALE_WIDTH(x) ((x) * MIN(SCREEN_WIDTH, SCREEN_HEIGHT) / 375.0f)
#define SCALE_HEIGHT(x) ((x) * MAX(SCREEN_WIDTH, SCREEN_HEIGHT) / 812.0f)

// 图片
#define PEImage(name) [[PEThemeTool shareThemeInstance] getThemeImageWithName:name]

// 字体大小
#define UIFontWithSize(fontsize) [UIFont systemFontOfSize:fontsize]
#define UIFontWithBoldSize(fontsize) [UIFont boldSystemFontOfSize:(fontsize)]

//property
#define    PROPERTY_ASSIGN @property (nonatomic, assign)
#define    PROPERTY_ASSIGN_READONLY @property (nonatomic, assign, readonly)
#define    PROPERTY_COPY @property (nonatomic, copy)
// strong
#ifndef PROPERTY_STRONG
#if __has_feature(objc_arc)
#define PROPERTY_STRONG @property(strong, nonatomic)
#else
#define PROPERTY_STRONG @property(retain, nonatomic)
#endif
#endif

#ifndef PROPERTY_STRONG_READONLY
#if __has_feature(objc_arc)
#define PROPERTY_STRONG_READONLY @property(strong, nonatomic, readonly)
#else
#define PROPERTY_STRONG_READONLY @property(retain, nonatomic, readonly)
#endif
#endif

// weak

#ifndef PROPERTY_WEAK
#if __has_feature(objc_arc_weak)
#define PROPERTY_WEAK @property(weak, nonatomic)
#elif __has_feature(objc_arc)
#define PROPERTY_WEAK @property(unsafe_unretained, nonatomic)
#else
#define PROPERTY_WEAK @property(assign, nonatomic)
#endif
#endif
#define PEWeak(var, weakSelf) __weak __typeof(&*var) weakSelf = var


/**
 *  判断是否为iPhone
 */
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)

/**
 *  判断是否为iPad
 */
#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

/**
 *  判断是否为ipod
 */
#define IS_IPOD ([[[UIDevice currentDevice] model] isEqualToString:@"iPod touch"])

/**
 *  判断是否retina屏
 */
#define IS_RETINA ([[UIScreen mainScreen] scale] >= 2.0)


/**
 *  获得屏幕长的那边
 */
#define SCREEN_MAX_LENGTH (MAX(SCREEN_WIDTH, SCREEN_HEIGHT))

/**
 *  获得屏幕短的那边
 */
#define SCREEN_MIN_LENGTH (MIN(SCREEN_WIDTH, SCREEN_HEIGHT))


/**
 *  iPhone4(包含)以下机型
 */
#define IS_IPHONE_4_OR_LESS (IS_IPHONE && SCREEN_MAX_LENGTH < 568.0)

/**
 *  iPhone5、iPhone5S机型
 */
#define IS_IPHONE_5 (IS_IPHONE && SCREEN_MAX_LENGTH == 568.0)

/**
 *  iPhone678机型
 */
#define IS_IPHONE_678 (IS_IPHONE && SCREEN_MAX_LENGTH == 667.0)

/**
 *  iPhone678P机型
 */
#define IS_IPHONE_678P (IS_IPHONE && SCREEN_MAX_LENGTH == 736.0)

/*
 *  iphone x
 */

/**
 *  IOS7.0以上系统版本
 */
#define IOS_VERSION_7_OR_ABOVE (([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) ? (YES):(NO))

// 计算角度
#define RADIANS_TO_DEGREES(x) ((x)/M_PI*180.0)
#define DEGREES_TO_RADIANS(x) ((x)/180.0*M_PI)
#define toRad(X) (X*M_PI/180.0)
// 类型装换字符串
#define NSStringFromInt(i) [NSString stringWithFormat:@"%zi", i]
#define NSStringFromObject(obj) [NSString stringWithFormat:@"%@", obj]
// imageName

#define ImageNamed(_pointer) [UIImage imageNamed:_pointer]

#define pi 3.14159265358979323846
#define degreesToRadian(x) (pi * x / 180.0)
#define radiansToDegrees(x) (180.0 * x / pi)

// color
#define RandomColor XMGColor(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))
#define PEColorAlpa(r,g,b,A) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:A]
#define PEColor(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:255/255.0]
#define DICT_PUT(dict, key, obj) {dict[key] = obj;}
//导航高度
#define NAV_HEIGHT 44
#define TAB_HEIGHT 49
#define kNavBarDefaultHeight  64
//安全区高度

#define SafeAreaTopBarHeight (IS_IPHONE && SCREEN_HEIGHT >= 812.0 ? 44 : 20)
#define SafeAreaTopHeight (IS_IPHONE && SCREEN_HEIGHT >= 812.0 ? 88 : 64)
#define SafeAreaBottomHeight (IS_IPHONE && SCREEN_HEIGHT >= 812.0 ? 34 : 0)
#define SafeAreaHeight (SCREEN_HEIGHT-SafeAreaTopHeight-SafeAreaBottomHeight)
#define IS_IPHONEX (IS_IPHONE && SCREEN_HEIGHT >= 812.0)

#ifndef __OPTIMIZE__
#define NSLog(...) NSLog(__VA_ARGS__)
#else
#define NSLog(...)
#endif

// 0. >>  打印
#ifdef DEBUG // 处于开发阶段
#define ZLog(...)           NSLog(__VA_ARGS__)

#define FNLog(...)          NSLog(__VA_ARGS__)
#else // 处于发布阶段
#define ZLog(...)

#define FNLog(...)
#endif




//判断对象是否为空
#define IS_STRING_NIL(objStr) (![objStr isKindOfClass:[NSString class]] || objStr == nil || [objStr length] <= 0)

#define IS_DICTIONARY_NIL(objDict) (![objDict isKindOfClass:[NSDictionary class]] || objDict == nil || [objDict count] <= 0)

#define IS_ARRAY_NIL(objArray) (![objArray isKindOfClass:[NSArray class]] || objArray == nil || [objArray count] <= 0)

#define IS_NUM_NIL(objNum) (![objNum isKindOfClass:[NSNumber class]] || objNum == nil)

#define IS_DATA_NIL(objData) (![objData isKindOfClass:[NSData class]] || objData == nil || [objData length] <= 0)

#define IS_URL_NIL(objURL) (![objURL isKindOfClass:[NSURL class]] || objURL == nil || [[objURL absoluteString] length] <= 0)

#define IS_OBJECT_NULL(obj) [obj isEqual:[NSNull null]]// 判断对象是否为null值

//判断delegate
#define IS_DELEGATE_RSP_SEL(iDel, iSel) (iDel != nil && [iDel respondsToSelector:@selector(iSel)])
#define IS_DELEGATE_RSP_ASEL(iDel, iSel) (iDel != nil && [iDel respondsToSelector:iSel])
#define IS_DELEGATE_CFM_PROTOCOL(iDel, iProtocol) (iDel != nil && [iDel conformsToProtocol:@protocol(iProtocol)])

@interface JZBasicSettings : NSObject

@end
