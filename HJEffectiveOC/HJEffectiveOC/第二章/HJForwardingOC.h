//
//  HJForwardingOC.h
//  HJEffectiveOC
//
//  Created by Hubbert on 16/9/16.
//  Copyright © 2016年 private. All rights reserved.
//

/*
 *type encoding
 *class_addMethod时候添加argument类型的地方
 *https://developer.apple.com/library/content/documentation/Cocoa/Conceptual/ObjCRuntimeGuide/Articles/ocrtTypeEncodings.html
 */

#import <Foundation/Foundation.h>

@interface HJForwardingOC : NSObject

//声明了两个setter/getter
@property (nonatomic,strong) NSString *title;
@property (nonatomic,strong) NSString *author;

- (void)doSomething;

@end
