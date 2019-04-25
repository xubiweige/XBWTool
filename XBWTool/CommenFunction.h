//
//  CommenFunction.h
//  DriverCimelia
//
//  Created by zw on 15/1/8.
//  Copyright (c) 2015年 zw. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface CommenFunction : NSObject

//格式化时间
+(NSString *)FormateTimeString:(NSString *)timeString showTime:(BOOL)showTime;
+(NSString *)FormateTimeAllString:(NSString *)timeString;
//判定时间差，确定是否需要显示时间
+(BOOL)CompareTimeString:(NSString *)timeString withTime:(NSString *)compareTime;
//显示 今天，昨天，月日
+(NSString *)FormateOnlyDateString:(NSString *)timeString;
//显示月日 时间
+(NSString *)FormateDateAndTime:(NSString *)timeString withTime:(BOOL)showTime;
//显示年月日 时间
+(NSString *)FormateDetailTime:(NSString *)timeString WithTime:(BOOL)showTime;
//获取日月
+(NSString*)getDDMMByTime:(NSString *)timeString;
//获取当前时间戳
+(NSString *)getNowTimeString;
//把秒转化成00时00分00秒
+(NSString *)FormateSecondString:(NSInteger)second;


//把服务器金额转为实际金额
+(NSString *)FormateMoney:(NSString *)money;
//把服务器金额转为实际金额
+(NSString *)FormateSymbolMoney:(NSString *)money;

//计算字符串，长宽
+ (float) heightForString:(NSString *)value fontSize:(float)fontSize andWidth:(float)width;
//计算字符串长宽
+ (CGSize)sizeWithText:(NSString *)text font:(UIFont *)font maxSize:(CGSize)maxSize;

//数组转字符串
+ (NSString *)ArrayToString:(NSArray *)array;

//sha加密
+ (NSString*) sha1 :(NSString *)input;

//文件目录创建
+(void)createDir:(NSString *)dirName;
//根据code获取文件目录
//needCreate 是否需要判定该目录的存在，不存在则会自动创建
+(NSString *)getDirNameByCode:(NSString *)code needCreate:(BOOL)needCreate;

//将颜色字符串转化为颜色
+(UIColor *)colorFromHexRGB:(NSString *)inColorString;

//图片的网络base64编码
+ (NSString*)encodeURL:(UIImage *)image;
//等比例压缩 图片
+ (UIImage *)compressImage:(UIImage *)sourceImage toTargetWidth:(CGFloat)targetWidth;

//车牌号格式化
+(NSString *)formateCarNumber:(NSString *)carNumber;

//周边 键值对互换
+ (NSString *)poiCodeAndValue:(NSString *)poiCodeOrValue  withType:(NSInteger)type;

//图片旋转
+(UIImage *)image:(UIImage *)image rotation:(UIImageOrientation)orientation;

+ (UIImage*)createImageWithColor:(UIColor*)color;
@end
