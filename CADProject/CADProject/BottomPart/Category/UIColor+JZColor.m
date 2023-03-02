
//
//  UIColor+PEColor.m
//  PercetIn
//
//  Created by Keven on 2018/8/7.
//  Copyright © 2018年 Keven. All rights reserved.
//

#import "UIColor+JZColor.h"

@implementation UIColor (JZColor)
+ (UIColor *)ColorAlphaWithR:(CGFloat)r G:(CGFloat)g B:(CGFloat)b A:(CGFloat)A{

	return [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:A];
}


+ (UIColor *)C_8195A5{

    return [self hexStringToColor:@"8195A5"];
}
+ (UIColor *)C_101D34{

    return [self hexStringToColor:@"101D34"];
}

+ (UIColor *)C_F0FAF6{

    return [self hexStringToColor:@"F0FAF6"];
}
+ (UIColor *)C_F1F5F8{

    return [self hexStringToColor:@"F1F5F8"];
}
+ (UIColor *)C_D8D8D8{

	return [self hexStringToColor:@"D8D8D8"];
}
+ (UIColor *)C_222222{

	return [self hexStringToColor:@"222222"];
}

+ (UIColor *)C_333333{

	return [self hexStringToColor:@"333333"];
}
+ (UIColor *)C_C8C8C8{

	return [self hexStringToColor:@"C8C8C8"];
}
+ (UIColor *)C_444444{

	return [self hexStringToColor:@"444444"];
}
+ (UIColor *)C_666666{

	return [self hexStringToColor:@"666666"];
}
+ (UIColor *)C_999999{

	return [self hexStringToColor:@"999999"];
}
+ (UIColor *)C_AAAAAA{

	return [self hexStringToColor:@"AAAAAA"];
}
+ (UIColor *)C_EEEEEE{

	return [self hexStringToColor:@"EEEEEE"];
}
+ (UIColor *)C_F3F3F4{

	return [self hexStringToColor:@"F3F3F4"];
}
+ (UIColor *)C_F7F7F7{

	return [self hexStringToColor:@"F7F7F7"];
}

+ (UIColor *)C_A9ACB4{

	return [self hexStringToColor:@"A9ACB4"];
}

+ (UIColor *)C_BtnColor{

    return [self hexStringToColor:@"414141"];
}
+ (UIColor *)C_313131{

    return [self hexStringToColor:@"313131"];
}
+ (UIColor *)C_111111{

	return [self hexStringToColor:@"111111"];
}
+ (UIColor *)C_163163163{

    return [self hexStringToColor:@"A3A3A3"];
}
+ (UIColor *)C_202020{

    return [self hexStringToColor:@"202020"];
}

+ (UIColor *)C_D8AE60{

    return [self hexStringToColor:@"D8AE60"];
}
+ (UIColor *)C_929292{

    return [self hexStringToColor:@"929292"];
}

+ (UIColor *)C_FFA450{

	return [self hexStringToColor:@"FFA450"];
}
+ (UIColor *)C_lineColor{

	return [UIColor C_CACACA];
}
/**
 color 54A935 绿色
 */
+(UIColor *)C_baseGreen{

    return [self hexStringToColor:@"00a188"];
}

/**
 color 90c7be 浅绿色
 */
+(UIColor *)C_baseLightGreen{

    return [self hexStringToColor:@"90c7be"];
}
+(UIColor *)C_54A935
{
    return [self hexStringToColor:@"54A935"];
}
+(UIColor *)C_CACACA
{
    return [self hexStringToColor:@"CACACA"];
}
+(UIColor *)C_128
{
    return PEColor(128, 128, 128);
}
+(UIColor *)C_525356
{
    return [self hexStringToColor:@"525356"];
}
+(UIColor *)C_252525
{
    return [self hexStringToColor:@"252525"];
}
+(UIColor *)C_F6F6F6
{
    return [self hexStringToColor:@"F6F6F6"];
}
+(UIColor *)C_F6F7FB
{
	return [self hexStringToColor:@"F6F7FB"];
}
+(UIColor *)C_9dca8c
{
    return [self hexStringToColor:@"9dca8c"];
}
+(UIColor *)C_e7e7e7
{
    return [self hexStringToColor:@"e7e7e7"];
}
+(UIColor *)C_FF0101
{
    return [self hexStringToColor:@"FF0101"];
}
+(UIColor *)C_FA7272
{
    return [self hexStringToColor:@"FA7272"];
}
+(UIColor *)FF5B5F
{
    return [self hexStringToColor:@"FF5B5F"];
}
+(UIColor *)C_0E9981
{
    return [self hexStringToColor:@"0E9981"];
}
/**
 color DDDDDD
 */
+(UIColor *)C_DDDDDD{

	return [self hexStringToColor:@"DDDDDD"];
}
/**
 color E83434
 */
+(UIColor *)C_E83434{

    return [self hexStringToColor:@"E83434"];
}
/**
 color F6A6A6
 */
+(UIColor *)C_F6A6A6{

    return [self hexStringToColor:@"F6A6A6"];
}

+(UIColor *) hexStringToColor: (NSString *) stringToConvert alpha:(CGFloat)alpha
{
    NSString *cString = [[stringToConvert stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    // String should be 6 or 8 characters

    if ([cString length] < 6) return [UIColor blackColor];
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"]) cString = [cString substringFromIndex:1];
    if ([cString length] != 6) return [UIColor blackColor];

    // Separate into r, g, b substrings

    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    // Scan values
    unsigned int r, g, b;

    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];

    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:alpha];

}
+(NSArray *) hexStringToRGB: (NSString *) stringToConvert
{

    NSString *cString = [[stringToConvert stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    // String should be 6 or 8 characters

    if ([cString length] < 6) return nil;
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"]) cString = [cString substringFromIndex:1];
    if ([cString length] != 6) return nil;

    // Separate into r, g, b substrings

    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    // Scan values
    unsigned int r, g, b;

    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];

    NSArray *array = [NSArray arrayWithObjects:[NSString stringWithFormat:@"%.0f",(float)r],[NSString stringWithFormat:@"%.0f",(float)g],[NSString stringWithFormat:@"%.0f",(float)b], nil];
    return array;

}
+(UIColor *) hexStringToColor: (NSString *) stringToConvert
{
    return [self hexStringToColor:stringToConvert alpha:1];
}

@end
