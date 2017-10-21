//
//  UIColor+HHAddition.h
//  Addition
//
//  Created by 花花 on 2017/1/17.
//  Copyright © 2017年 花花. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (HHAddition)

/**
 <#Description#>

 @param color 默认alpha值为1
 @return <#return value description#>
 */
+ (UIColor *)colorWithHexString:(NSString *)color;


//从十六进制字符串获取颜色，
//color:支持@“#123456”、 @“0X123456”、 @“123456”三种格式
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;

/**
 生成随机颜色

 @return 随机颜色
 */
+ (instancetype)hh_redomColor;



/**
 使用R/G/B 数组创建颜色

 @param red 红色
 @param green 绿色
 @param blue 蓝色
 @return 颜色
 */
+ (instancetype)hh_colorWithRed:(uint8_t)red green:(uint8_t)green blue:(uint8_t)blue;


@end
