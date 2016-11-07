//
//  UIAlertView+iOS8Ext.m
//  UIAlertView+iOS8Ext
//
//  Created by 王亮 on 16/8/24.
//  Copyright © 2016年 王亮. All rights reserved.
//

#import "UIAlertView+iOS8Ext.h"

@implementation UIAlertView(iOS8Ext)

+ (void)showWithTag:(NSInteger)tag title:(NSString *)title message:(NSString *)message delegate:(id<UIAlertViewDelegate>)delegate cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitle:(NSString *)otherButtonTitle
{
    if (([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)) {
        
        NSString *alertTitle = title;
        
        if (alertTitle == nil) {
            alertTitle = @"";
        }
        
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:alertTitle message:message preferredStyle:UIAlertControllerStyleAlert];
        alertController.view.tag = tag;
        
        if (cancelButtonTitle) {
            UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelButtonTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
                if (delegate && [delegate respondsToSelector:@selector(alertView:clickedButtonAtIndex:)]) {
                    [delegate alertView:(UIAlertView *)alertController.view clickedButtonAtIndex:0];
                }
            }];
            [alertController addAction:cancelAction];
        }
        
        if (otherButtonTitle) {
            UIAlertAction *otherAction = [UIAlertAction actionWithTitle:otherButtonTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                if (delegate && [delegate respondsToSelector:@selector(alertView:clickedButtonAtIndex:)]) {
                    [delegate alertView:(UIAlertView *)alertController.view clickedButtonAtIndex:1];
                }
            }];
            [alertController addAction:otherAction];
        }
        
        if([delegate isKindOfClass:[UIViewController class]]) {
            [((UIViewController *)delegate) presentViewController:alertController animated:YES completion:nil];
        }
        else {
            UIViewController *vc;
            if ([[UIApplication sharedApplication].windows count] > 1) {
                vc = [UIApplication sharedApplication].windows[1].rootViewController;
            }
            else {
                vc = [UIApplication sharedApplication].delegate.window.rootViewController;
            }
            [vc presentViewController:alertController animated:YES completion:nil];
        }
    }
    else {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title message:message delegate:delegate cancelButtonTitle:cancelButtonTitle otherButtonTitles:otherButtonTitle,nil];
        alertView.tag = tag;
        [alertView show];
    }
}

#pragma clang diagnostic pop

@end
