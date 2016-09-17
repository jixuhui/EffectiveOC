//
//  ViewController.m
//  HJEffectiveOC
//
//  Created by Hubbert on 16/8/13.
//  Copyright © 2016年 private. All rights reserved.
//

#import "ViewController.h"
#import "HXHCommon.h"
#import "HXHForwardingOC.h"
#import <objc/runtime.h>

#define SuppressPerformSelectorLeakWarning(Stuff) \
do { \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
Stuff; \
_Pragma("clang diagnostic pop") \
} while (0)

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"%f",HXHCommonStatus);
    HXHForwardingOC *forwardingObj = [[HXHForwardingOC alloc] init];
    
    
    SuppressPerformSelectorLeakWarning(
                                       [forwardingObj performSelector:NSSelectorFromString(@"resolveThisMethodDynamically")];
                                       );
    
//    [HXHForwardingOC performSelector:NSSelectorFromString(@"resolveClassMethodDynamically")];
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
