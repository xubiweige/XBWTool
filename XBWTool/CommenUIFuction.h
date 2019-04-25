//
//  CommenUIFuction.h
//  DriverCimelia
//
//  Created by zw on 15/1/29.
//  Copyright (c) 2015年 zw. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
//通过颜色值获取颜色
#define UIColorFromRGB(rgbValue)    [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define MAX_WORD_NUMBER 140

#define COMMEN_LINE_COLOR [UIColor colorWithRed:0xd7/255.0 green:0xd7/255.0 blue:0xd7/255.0 alpha:1.0]
#define COMMEN_LINE_CGCOLOR [UIColor colorWithRed:0xe6/255.0 green:0xe6/255.0 blue:0xe6/255.0 alpha:1.0].CGColor
#define MENU_LINE_COLOR [UIColor colorWithRed:0x2e/255.0 green:0x2e/255.0 blue:0x2e/255.0 alpha:1.0]

CG_INLINE void alertMessage(NSString *message)
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:message delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
    [alertView show];
}

@interface CommenUIFuction : NSObject

//添加箭头
+(void)addArrowInView:(UIView *)view WithFrame:(CGRect)frame;

//添加线
+(void)addLineInView:(UIView *)view WithFrame:(CGRect)frame;
//添加 白线
+(void)addWhiteLineInView:(UIView *)view WithFrame:(CGRect)frame;
+(void)addGrayLineInView:(UIView *)view WithFrame:(CGRect)frame;
+(void)addMenuLineInView:(UIView *)view WithFrame:(CGRect)frame;

//添加标签Lbl
+(void)addLabelInView:(UIView *)view WithFrame:(CGRect)frame color:(UIColor *)color fontSize:(CGFloat)size text:(NSString *)text align:(NSTextAlignment)align;
+(UILabel *)LabelWithFrame:(CGRect)frame color:(UIColor *)color fontSize:(CGFloat)size text:(NSString *)text align:(NSTextAlignment)align;
+(UILabel *)LabelWithFrame:(CGRect)frame color:(UIColor *)color font:(UIFont *)font text:(NSString *)text align:(NSTextAlignment)align;

//添加图标
+(void)addImageViewInView:(UIView *)view WithFrame:(CGRect)frame imageName:(NSString *)imageName;
@end
