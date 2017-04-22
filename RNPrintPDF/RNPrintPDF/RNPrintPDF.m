//
//  RNPrintPDF.m
//  RNPrintPDF
//
//  Created by 晁荣 on 17/4/21.
//  Copyright © 2017年 maichong. All rights reserved.
//

#import "RNPrintPDF.h"

@implementation RNPrintPDF

RCT_EXPORT_MODULE();

//测试方法导出
RCT_EXPORT_METHOD(testPrint:(NSString *)text
                  callback:(RCTResponseSenderBlock)callback)
{
    NSString *testStr = [NSString stringWithFormat:@"%@",text];
    NSLog(@"testStr is :%@",testStr);
    //NSString *message = @"callback message!!!";
    callback(@[[NSNull null], testStr]);
}

RCT_EXPORT_METHOD(printPDF:portName:(NSString *)portName
                           portSettings:(NSString *)portSettings
                           callback:(RCTResponseSenderBlock)callback)
{
    if (portName == nil) {
        callback(@[@"portName not found.", @""]);
        return;
    }
    if (portSettings == nil) {
        callback(@[@"portSettings not found.", @""]);
        return;
    }
    //NSLog(@"%@",message);
    /* Always round up coordinates before passing them into UIKit
     */
    int width = 576; // 3 Inch
    CGFloat imageWidth = ceilf( 22 * sqrtf( 10));
    CGSize imageSize = CGSizeMake( imageWidth, imageWidth );
    UIImage *imagePrint = [ UIImage imageWithPDFNamed:@"YinYang.pdf" atSize:imageSize ];
    [PrinterFunctions PrintImageWithPortname:portName
                                portSettings:portSettings
                                imageToPrint:imagePrint
                                    maxWidth:width compressionEnable:false
                              withDrawerKick:NO];
    callback(@[@"", @" print pdf is success!"]);
}
@end