//
//  ViewController.m
//  HJEffectiveOC
//
//  Created by Hubbert on 16/8/13.
//  Copyright © 2016年 private. All rights reserved.
//

#import "ViewController.h"
#import "HJCommon.h"
#import "HJForwardingOC.h"
#import <objc/runtime.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"%f",HJCommonStatus);
    HJForwardingOC *forwardingObj = [[HJForwardingOC alloc] init];
    [forwardingObj performSelector:NSSelectorFromString(@"resolveThisMethodDynamically")];
//    [HJForwardingOC performSelector:NSSelectorFromString(@"resolveClassMethodDynamically")];
    forwardingObj.title = @"One Million of USA";
    forwardingObj.author = @"Mark Towin";
    NSLog(@"author...%@,title...%@",forwardingObj.author,forwardingObj.title);
    [forwardingObj doSomething];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
