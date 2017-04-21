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

RCT_EXPORT_METHOD(testDemo:(NSString *)message){
    NSLog(@"string is :%@",message);
    //NSLog(@"%@",message);
}

RCT_EXPORT_METHOD(printPDF:(NSString *)message){
    NSLog(@"string is :%@",message);
    //NSLog(@"%@",message);
    /* Always round up coordinates before passing them into UIKit
     */
    ///////print///////
    static NSString *portName = @"portName";
    static NSString *portSettings = @"portSettings";
    
    int width = 576; // 3 Inch
    CGFloat imageWidth = ceilf( 22 * sqrtf( 10));
    CGSize imageSize = CGSizeMake( imageWidth, imageWidth );
    UIImage *imagePrint = [ UIImage imageWithPDFNamed:@"YinYang.pdf" atSize:imageSize ];
    [PrinterFunctions PrintImageWithPortname:portName
                                portSettings:portSettings
                                imageToPrint:imagePrint
                                    maxWidth:width compressionEnable:false
                              withDrawerKick:NO];
}
@end
