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

RCT_EXPORT_METHOD(testPrint:(NSString *)message
                  callback:(RCTResponseSenderBlock)callback){
    NSLog(@"string is :%@",message);
    //NSLog(@"%@",message);
    callback(@[[NSNull null], message]);
}
RCT_EXPORT_METHOD(searchPrinter:(RCTResponseSenderBlock)callback){
    NSArray *portArray = [[PrinterFunctions SearchPrinter] retain];
    callback(@[[NSNull null], portArray]);
}
RCT_EXPORT_METHOD(printPDF:(NSString *)filePath
                  portName:(NSString *)portName
                  portSettings:(NSString *)portSettings
                  callback:(RCTResponseSenderBlock)callback)
{
    NSString * resultStr = nil;
    //    NSLog(@"imagePrint=>filePath===%@",filePath);
    if (filePath == nil) {
        callback(@[@"filePath not found.", @""]);
        return;
    }
    if (portName == nil) {
        callback(@[@"portName not found.", @""]);
        return;
    }
    //    portSettings = @"Portable";
    if (portSettings == nil) {
        portSettings = @"Portable";
    }
    //NSLog(@"%@",message);
    /* Always round up coordinates before passing them into UIKit
     */
    int maxWidthPrint = 384; //2 Inch:384  3 Inch:576 4 Inch:832
    UIImage *imagePrint = [ UIImage imageOrPDFWithContentsOfFile:filePath];
    //    NSString *path_sandox = NSHomeDirectory();
    //    //设置一个图片的存储路径
    //    NSString *imagePath = [path_sandox stringByAppendingString:@"/tmp/ticket.jpg"];
    //    //把图片直接保存到指定的路径（同时应该把图片的路径imagePath存起来，下次就可以直接用来取）
    //    [UIImagePNGRepresentation(imageTemp) writeToFile:imagePath atomically:YES];
    //    //读取图片
    //    UIImage *imagePrint = [UIImage imageWithContentsOfFile:imagePath];
    NSLog(@"imagePrint===%@",imagePrint);
    if(imagePrint == nil){
        callback(@[@"", @"Not Found Ticket"]);
        return;
    }
    if([portSettings isEqualToString: @"Portable"]){
        //        NSLog(@"PrintImageWithPortname===>>");
        resultStr = [PrinterFunctions PrintImageWithPortname:portName
                                                portSettings:portSettings
                                                imageToPrint:imagePrint
                                                    maxWidth:maxWidthPrint
                                           compressionEnable:true
                                              withDrawerKick:NO];
    } else{
        //        NSLog(@"PrintBitmapWithPortName===>>");
        resultStr = [PrinterFunctions PrintBitmapWithPortName:portName
                                                 portSettings:portSettings
                                                  imageSource:imagePrint
                                                 printerWidth:maxWidthPrint
                                            compressionEnable:true
                                               pageModeEnable:true];
    }
    if(resultStr == nil){
        resultStr = @"Error: portException";
    }
    callback(@[@"", resultStr]);
}
@end
