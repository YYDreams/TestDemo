//
//  UIColor+HHAddition.m
//  Addition
//
//  Created by 花花 on 2017/1/17.
//  Copyright © 2017年 花花. All rights reserved.
//

#import "UIColor+HHAddition.h"

@implementation UIColor (HHAddition)

+ (UIColor *)colorWithHexString:(NSString *)color{

 return [self colorWithHexString:color alpha:1.0f];
}
//从十六进制字符串获取颜色，
//color:支持@“#123456”、 @“0X123456”、 @“123456”三种格式
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha{
    //删除字符串中的空格
    NSString *cString = [[color
                          stringByTrimmingCharactersInSet:[NSCharacterSet
                                                           whitespaceAndNewlineCharacterSet]]
                         uppercaseString];
    // String should be 6 or 8 characters
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    // strip 0X if it appears
    //如果是0x开头的，那么截取字符串，字符串从索引为2的位置开始，一直到末尾
    if ([cString hasPrefix:@"0X"]) {
        cString = [cString substringFromIndex:2];
    }
    //如果是#开头的，那么截取字符串，字符串从索引为1的位置开始，一直到末尾
    if ([cString hasPrefix:@"#"]) {
        cString = [cString substringFromIndex:1];
    }
    if ([cString length] != 6) {
        return [UIColor clearColor];
    }
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    // r
    NSString *rString = [cString substringWithRange:range];
    // g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    // b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    return [UIColor colorWithRed:((float)r / 255.0f)
                           green:((float)g / 255.0f)
                            blue:((float)b / 255.0f)
                           alpha:alpha];

}


/**
 生成随机颜色
 
 @return 随机颜色
 */
+ (instancetype)hh_redomColor{
    
    return [UIColor hh_colorWithRed:arc4random_uniform(256) green:arc4random_uniform(256) blue:arc4random_uniform(256)];
    

}

/**
 使用R/G/B 数组创建颜色
 
 @param red 红色
 @param green 绿色
 @param blue 蓝色
 @return 颜色
 */
+ (instancetype)hh_colorWithRed:(uint8_t)red green:(uint8_t)green blue:(uint8_t)blue{
    
    return [UIColor colorWithRed:red / 255.0 green:green / 255.0 blue:blue / 255.0 alpha:1.0];
}


@end
