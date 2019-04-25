//
//  CommenFunction.m
//  DriverCimelia
//
//  Created by zw on 15/1/8.
//  Copyright (c) 2015年 zw. All rights reserved.
//

#import "CommenFunction.h"
#import <CommonCrypto/CommonDigest.h>

//#import "GTMBase64.h"

@implementation CommenFunction

//格式化时间
+(NSString *)FormateTimeString:(NSString *)timeString showTime:(BOOL)showTime{
    NSDate *timeDate = [NSDate dateWithTimeIntervalSince1970:[timeString longLongValue]/1000];
    double timeCha = fabs([timeDate timeIntervalSinceNow]) ;
    if(timeCha < 60){
        return @"刚刚";
    }else if(timeCha < 3600){
        return [NSString stringWithFormat:@"%d分钟前",(int)timeCha/60] ;
    }else{
        NSDate *now = [NSDate date];
        NSCalendar *cal = [NSCalendar currentCalendar];
        NSDateComponents *dd = [cal components:NSYearCalendarUnit| NSMonthCalendarUnit |NSDayCalendarUnit| NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit fromDate:now];
        NSDateComponents *ddEx = [cal components:NSYearCalendarUnit| NSMonthCalendarUnit |NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit fromDate:timeDate];
        if ([dd year]==[ddEx year] && [dd month] == [ddEx month] && [dd day] == [ddEx day]) {
            return [NSString stringWithFormat:@"今天%02d:%02d",(int)[ddEx hour],(int)[ddEx minute]];
        }else{
            return showTime?[NSString stringWithFormat:@"%d月%02d日%02d:%02d",(int)[ddEx month],(int)[ddEx day],(int)[ddEx hour],(int)[ddEx minute]]:[NSString stringWithFormat:@"%d月%02d日",(int)[ddEx month],(int)[ddEx day]];
        }
    }
}
//格式化时间,年月日
+(NSString *)FormateTimeAllString:(NSString *)timeString{
    NSDate *timeDate = [NSDate dateWithTimeIntervalSince1970:[timeString longLongValue]/1000];
    NSCalendar *cal = [NSCalendar currentCalendar];
    
    NSDateComponents *ddEx = [cal components:NSYearCalendarUnit| NSMonthCalendarUnit |NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit fromDate:timeDate];
    
    NSString *str = [NSString stringWithFormat:@"%ld年%d月%02d日%02d:%02d",(long)[ddEx year],(int)[ddEx month],(int)[ddEx day],(int)[ddEx hour],(int)[ddEx minute]];
    return str;
}

+(BOOL)CompareTimeString:(NSString *)timeString withTime:(NSString *)compareTime{
    NSDate *timeDate = [NSDate dateWithTimeIntervalSince1970:[timeString longLongValue]/1000];
    NSDate *compareDate = [NSDate dateWithTimeIntervalSince1970:[compareTime longLongValue]/1000];
    double timeCha = fabs([timeDate timeIntervalSinceDate:compareDate]) ;
    
    if(timeCha < 120){
        return NO;
    }
    return YES;
}

//显示 今天，昨天，月日
+(NSString *)FormateOnlyDateString:(NSString *)timeString{
    NSDate *timeDate = [NSDate dateWithTimeIntervalSince1970:[timeString longLongValue]/1000];
    NSDate *now = [NSDate date];
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *dd = [cal components:NSYearCalendarUnit| NSMonthCalendarUnit |NSDayCalendarUnit| NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit fromDate:now];
    NSDateComponents *ddEx = [cal components:NSYearCalendarUnit| NSMonthCalendarUnit |NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit fromDate:timeDate];
    double timeCha = fabs([timeDate timeIntervalSinceNow]) ;

    CGFloat timeOffset = (3600* (24 + [dd hour]) + [dd minute] * 60 + [dd second]);
    if(timeCha <= timeOffset){   //昨天 && 今天
        if ([dd year]==[ddEx year] && [dd month] == [ddEx month] && [dd day] == [ddEx day]) {
            return @"今天";
        }else{
            return @"昨天";
        }
    }else{
        return [NSString stringWithFormat:@"%d月%d日",(int)[ddEx month],(int)[ddEx day]];
    }
}

//显示月日 时间
+(NSString *)FormateDateAndTime:(NSString *)timeString withTime:(BOOL)showTime{
    NSDate *timeDate = [NSDate dateWithTimeIntervalSince1970:[timeString longLongValue]/1000];
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *ddEx = [cal components:NSYearCalendarUnit| NSMonthCalendarUnit |NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit fromDate:timeDate];
    return showTime?[NSString stringWithFormat:@"%d月%02d日%02d:%02d",(int)[ddEx month],(int)[ddEx day],(int)[ddEx hour],(int)[ddEx minute]]:[NSString stringWithFormat:@"%d月%02d日",(int)[ddEx month],(int)[ddEx day]];
}
//显示年月日 时间
+(NSString *)FormateDetailTime:(NSString *)timeString WithTime:(BOOL)showTime{
    NSDate *timeDate = [NSDate dateWithTimeIntervalSince1970:[timeString longLongValue]/1000];
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *ddEx = [cal components:NSYearCalendarUnit| NSMonthCalendarUnit |NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit fromDate:timeDate];
    return showTime?[NSString stringWithFormat:@"%d年%d月%02d日%02d:%02d",(int)[ddEx year],(int)[ddEx month],(int)[ddEx day],(int)[ddEx hour],(int)[ddEx minute]]:[NSString stringWithFormat:@"%d年%d月%02d日",(int)[ddEx year],(int)[ddEx month],(int)[ddEx day]];
}

//获取日月
+(NSString*)getDDMMByTime:(NSString *)timeString{
    NSDate *timeDate = [NSDate dateWithTimeIntervalSince1970:[timeString longLongValue]/1000];
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *ddEx = [cal components:NSYearCalendarUnit| NSMonthCalendarUnit |NSDayCalendarUnit fromDate:timeDate];
    return [NSString stringWithFormat:@"%02d%d月",(int)[ddEx day],(int)[ddEx month]];
}

//获取当前时间戳
+(NSString *)getNowTimeString{
    long long timeNumber = [[NSNumber numberWithDouble:[[NSDate date] timeIntervalSince1970] *1000] longLongValue];
    return [NSString stringWithFormat:@"%@",@(timeNumber)];
}

//把秒转化成00：00：00
+(NSString *)FormateSecondString:(NSInteger)second{
    int hour = (int)second / 3600;
    second = second % 3600;
    int minite = (int)second / 60;
    int second2 = (int)second % 60;
    return [NSString stringWithFormat:@"%02d时%02d分%02d秒",hour,minite,second2];
}

//把服务器金额转为实际金额
+(NSString *)FormateMoney:(NSString *)money{
    return [NSString stringWithFormat:@"%.2f元",[money doubleValue]/10000];
}

//把服务器金额转为实际金额
+(NSString *)FormateSymbolMoney:(NSString *)money{
    return [NSString stringWithFormat:@"￥%.2f",[money doubleValue]/10000];
}


/**
 @method 获取指定宽度情况ixa，字符串value的高度
 @param value 待计算的字符串
 @param fontSize 字体的大小
 @param andWidth 限制字符串显示区域的宽度
 @result float 返回的高度
 */
+ (float)heightForString:(NSString *)value fontSize:(float)fontSize andWidth:(float)width{
    CGRect sizeToFit = [value boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]} context:nil];
    return sizeToFit.size.height;
}

+ (CGSize)sizeWithText:(NSString *)text font:(UIFont *)font maxSize:(CGSize)maxSize{
    CGRect sizeToFit = [text boundingRectWithSize:maxSize options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:font} context:nil];
    return sizeToFit.size;
}


//数组转字符串
+ (NSString *)ArrayToString:(NSArray *)array{
    if (array.count) {
        NSString *string = array[0];
        for (int i = 1; i < array.count; i ++) {
            string = [NSString stringWithFormat:@"%@,%@",string,array[i]];
        }
        return string;
    }
    return @"";
}

//sha加密
+ (NSString*) sha1 :(NSString *)input
{
//    const char *cstr = [input cStringUsingEncoding:NSUTF8StringEncoding];
//    NSData *data = [NSData dataWithBytes:cstr length:input.length];
    NSData *data = [input dataUsingEncoding:NSUTF8StringEncoding];

    uint8_t digest[CC_SHA1_DIGEST_LENGTH];
    
    CC_SHA1(data.bytes, (CC_LONG)data.length, digest);
    
    NSMutableString* output = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_SHA1_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x", digest[i]];
    
    return output;
}

//文件目录创建
+(void)createDir:(NSString *)dirName{
    BOOL isDir = NO;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL existed = [fileManager fileExistsAtPath:dirName isDirectory:&isDir];
    if (!(isDir == YES && existed == YES)){
        [fileManager createDirectoryAtPath:dirName withIntermediateDirectories:YES attributes:nil error:nil];
    }
}

//根据code获取文件目录
//needCreate 是否需要判定该目录的存在，不存在则会自动创建
+(NSString *)getDirNameByCode:(NSString *)code needCreate:(BOOL)needCreate{
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *dirName = [NSString stringWithFormat:@"%@/%@",path,code];
    
    if (needCreate) {
        BOOL isDir = NO;
        NSFileManager *fileManager = [NSFileManager defaultManager];
        BOOL existed = [fileManager fileExistsAtPath:dirName isDirectory:&isDir];
        if (!(isDir == YES && existed == YES)){
            [fileManager createDirectoryAtPath:dirName withIntermediateDirectories:YES attributes:nil error:nil];
        }
    }
    return dirName;
}


//将颜色字符串转化为颜色
+(UIColor *)colorFromHexRGB:(NSString *)inColorString{
    inColorString = [inColorString stringByReplacingOccurrencesOfString:@"#" withString:@""];
    
    //如果颜色值传入错误，则默认返回黑色
    if (!inColorString || [inColorString length]!=6) {
        return [UIColor blackColor];
    }
    
    UIColor *result = nil;
    unsigned int colorCode = 0;
    
    if (inColorString){
        NSScanner *scanner = [NSScanner scannerWithString:inColorString];
        (void) [scanner scanHexInt:&colorCode]; // ignore error
    }
    
    unsigned char redByte = (unsigned char) (colorCode >> 16);
    unsigned char greenByte = (unsigned char) (colorCode >> 8);
    unsigned char blueByte = (unsigned char) (colorCode); // masks off high bits
    result = [UIColor colorWithRed: (float)redByte / 0xff green: (float)greenByte/ 0xff blue: (float)blueByte / 0xff alpha:1.0];
    
    return result;
}

//图片的网络base64编码
//+(NSString*)encodeURL:(UIImage *)image{
//    NSData *mydata= UIImageJPEGRepresentation(image ,0.25);
//    NSString *base64String = [GTMBase64 stringByWebSafeEncodingData:mydata padded:YES];
//    NSString *str = [NSString stringWithFormat:@"jpg@%@",base64String];
//    return str;
//}

//等比例压缩
+ (UIImage *)compressImage:(UIImage *)sourceImage toTargetWidth:(CGFloat)targetWidth{
    CGSize imageSize = sourceImage.size;
    
    CGFloat width = imageSize.width;
    CGFloat height = imageSize.height;
    
    CGFloat targetHeight = (targetWidth / width) * height;
    
    UIGraphicsBeginImageContext(CGSizeMake(targetWidth, targetHeight));
    [sourceImage drawInRect:CGRectMake(0, 0, targetWidth, targetHeight)];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

//车牌号格式化
+(NSString *)formateCarNumber:(NSString *)carNumber{
    if([carNumber rangeOfString:@"-"].location !=NSNotFound){
        return carNumber;
    }else{
        if (carNumber.length < 6) {
            return carNumber;
        }else{
            return [NSString stringWithFormat:@"%@-%@",[carNumber substringToIndex:2],[carNumber substringFromIndex:2]];
        }
    }
}


+ (NSString *)poiCodeAndValue:(NSString *)poiCodeOrValue  withType:(NSInteger)type
{
    NSArray * poiCodeArray = [NSArray arrayWithObjects:@"0413",@"1800",@"0799",@"0898",@"0301",@"0499",@"0101",@"0498",@"0000",@"0408",@"0409",@"0803", nil] ;
    NSArray * valueArray = [NSArray arrayWithObjects:@"服务区",@"警示",@"物流园",@"超限站",@"汽车旅馆",@"加气站",@"餐馆",@"收费站",@"吐槽",@"加油站",@"停车场",@"修理服务", nil] ;
    if(type == 1){
        for ( int i = 0; i < poiCodeArray.count; i++) {
            if([poiCodeOrValue isEqualToString:[poiCodeArray objectAtIndex:i]])
            {
                NSString * valueStr = [valueArray objectAtIndex:i] ;
                return valueStr ;
            }
        }
        return @"吐槽";
    }else if(type == 2) {
        for(int j = 0 ; j < valueArray.count ; j++ ){
            if([poiCodeOrValue isEqualToString:[valueArray objectAtIndex:j]]){
                NSString * poicodeStr = [poiCodeArray objectAtIndex:j] ;
                return poicodeStr ;
            }
        }
        return @"0000";
    }
    return nil ;
}


//图片旋转
+ (UIImage *)image:(UIImage *)image rotation:(UIImageOrientation)orientation
{
    long double rotate = 0.0;
    CGRect rect;
    float translateX = 0;
    float translateY = 0;
    float scaleX = 1.0;
    float scaleY = 1.0;
    
    switch (orientation) {
        case UIImageOrientationLeft:
            rotate = M_PI_2;
            rect = CGRectMake(0, 0, image.size.height, image.size.width);
            translateX = 0;
            translateY = -rect.size.width;
            scaleY = rect.size.width/rect.size.height;
            scaleX = rect.size.height/rect.size.width;
            break;
        case UIImageOrientationRight:
            rotate = 3 * M_PI_2;
            rect = CGRectMake(0, 0, image.size.height, image.size.width);
            translateX = -rect.size.height;
            translateY = 0;
            scaleY = rect.size.width/rect.size.height;
            scaleX = rect.size.height/rect.size.width;
            break;
        case UIImageOrientationDown:
            rotate = M_PI;
            rect = CGRectMake(0, 0, image.size.width, image.size.height);
            translateX = -rect.size.width;
            translateY = -rect.size.height;
            break;
        default:
            rotate = 0.0;
            rect = CGRectMake(0, 0, image.size.width, image.size.height);
            translateX = 0;
            translateY = 0;
            break;
    }
    
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    //做CTM变换
    CGContextTranslateCTM(context, 0.0, rect.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    CGContextRotateCTM(context, rotate);
    CGContextTranslateCTM(context, translateX, translateY);
    
    CGContextScaleCTM(context, scaleX, scaleY);
    //绘制图片
    CGContextDrawImage(context, CGRectMake(0, 0, rect.size.width, rect.size.height), image.CGImage);
    
    UIImage *newPic = UIGraphicsGetImageFromCurrentImageContext();
    
    return newPic;
}

+ (UIImage*)createImageWithColor:(UIColor*)color{
    
    CGRect rect=CGRectMake(0.0f,0.0f,1.0f,1.0f);
    UIGraphicsBeginImageContext(rect.size);
    
    CGContextRef context=UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    
    CGContextFillRect(context, rect);
    
    UIImage *theImage=UIGraphicsGetImageFromCurrentImageContext();UIGraphicsEndImageContext();
    return theImage;
    
}


@end
