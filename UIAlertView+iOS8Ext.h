//
//  UIAlertView+iOS8Ext.h
//  UIAlertView+iOS8Ext
//
//  Created by 王亮 on 16/8/24.
//  Copyright © 2016年 王亮. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface UIAlertView(iOS8Ext)

+ (void)showWithTag:(NSInteger)tag title:(nullable NSString *)title message:(nullable NSString *)message delegate:(nullable id<UIAlertViewDelegate>)delegate cancelButtonTitle:(nullable NSString *)cancelButtonTitle otherButtonTitle:(nullable NSString *)otherButtonTitle;

@end
