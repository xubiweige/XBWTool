//
//  CommenUIFuction.m
//  DriverCimelia
//
//  Created by zw on 15/1/29.
//  Copyright (c) 2015年 zw. All rights reserved.
//

#import "CommenUIFuction.h"

@implementation CommenUIFuction

//添加箭头
+(void)addArrowInView:(UIView *)view WithFrame:(CGRect)frame{
    UIImageView * arrow = [[UIImageView alloc] initWithFrame:frame];
    arrow.image = [UIImage imageNamed:@"设置_小箭头"];
    [view addSubview:arrow];
}

//添加 淡线
+(void)addLineInView:(UIView *)view WithFrame:(CGRect)frame{
    UIView *line = [[UIView alloc]initWithFrame:frame];
    line.backgroundColor = COMMEN_LINE_COLOR;
    [view addSubview:line];
}
//添加 白线
+(void)addWhiteLineInView:(UIView *)view WithFrame:(CGRect)frame{
    UIView *line = [[UIView alloc]initWithFrame:frame];
    line.backgroundColor = UIColorFromRGB(0xffffff);
    [view addSubview:line];
}

//添加 lightgray线
+(void)addGrayLineInView:(UIView *)view WithFrame:(CGRect)frame{
    UIView *line = [[UIView alloc]initWithFrame:frame];
    line.backgroundColor = [UIColor lightGrayColor];
    [view addSubview:line];
}

//添加 弹出框线
+(void)addMenuLineInView:(UIView *)view WithFrame:(CGRect)frame{
    UIView *line = [[UIView alloc]initWithFrame:frame];
    line.backgroundColor = MENU_LINE_COLOR;
    [view addSubview:line];
}

//添加标签Lbl
+(void)addLabelInView:(UIView *)view WithFrame:(CGRect)frame color:(UIColor*)color fontSize:(CGFloat)size text:(NSString *)text align:(NSTextAlignment)align{
    UILabel *lbl = [[UILabel alloc]initWithFrame:frame];
    lbl.backgroundColor = [UIColor clearColor];
    lbl.text = text;
    lbl.font = [UIFont systemFontOfSize:size];
    lbl.textColor = color;
    lbl.textAlignment = align;
    [view addSubview:lbl];
}

+(UILabel *)LabelWithFrame:(CGRect)frame color:(UIColor *)color fontSize:(CGFloat)size text:(NSString *)text align:(NSTextAlignment)align{
    UILabel *lbl = [[UILabel alloc]initWithFrame:frame];
    lbl.backgroundColor = [UIColor clearColor];
    lbl.text = text;
    lbl.font = [UIFont systemFontOfSize:size];
    lbl.textColor = color;
    lbl.textAlignment = align;
    return lbl;
}

+(UILabel *)LabelWithFrame:(CGRect)frame color:(UIColor *)color font:(UIFont *)font text:(NSString *)text align:(NSTextAlignment)align{
    UILabel *lbl = [[UILabel alloc]initWithFrame:frame];
    lbl.backgroundColor = [UIColor clearColor];
    lbl.text = text;
    lbl.font = font;
    lbl.textColor = color;
    lbl.textAlignment = align;
    return lbl;
}

//添加图标
+(void)addImageViewInView:(UIView *)view WithFrame:(CGRect)frame imageName:(NSString *)imageName{
    UIImageView *iconImgV = [[UIImageView alloc] initWithFrame:frame];
    iconImgV.image = [UIImage imageNamed:imageName];
    [view addSubview:iconImgV];
}
@end
