//
//  ViewController.m
//  Test
//
//  Created by 王亮 on 16/11/7.
//  Copyright © 2016年 王亮. All rights reserved.
//

#import "ViewController.h"
#import "UIAlertView+iOS8Ext.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [UIAlertView showWithTag:0 title:@"title" message:@"hello" delegate:nil cancelButtonTitle:@"cancel" otherButtonTitle:@"other"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
