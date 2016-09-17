//
//  HXHForwardingOC.m
//  HJEffectiveOC
//
//  Created by Hubbert on 16/9/16.
//  Copyright © 2016年 private. All rights reserved.
//

#import "HXHForwardingOC.h"
#import <objc/runtime.h>

//转发目标类
@interface NoneClass : NSObject
@end

@implementation NoneClass
+(void)load
{
    NSLog(@"NoneClass _cmd: %@", NSStringFromSelector(_cmd));
}

- (void) noneClassMethod
{
    NSLog(@"_cmd: %@", NSStringFromSelector(_cmd));
}
@end

@interface HXHForwardingOC()
{
    NSMutableDictionary *data;
}
@end

@implementation HXHForwardingOC
@dynamic title,author;//不自动生成实现

+ (void)load
{
    Method originalMethod = class_getInstanceMethod([self class], @selector(doSomething));
    Method swappedMethod = class_getInstanceMethod([self class], @selector(newDoSomething));
    method_exchangeImplementations(originalMethod, swappedMethod);
}

- (id)init
{
    if ((self = [super init])) {
        data = [[NSMutableDictionary alloc] init];
        [data setObject:@"Tom Sawyer" forKey:@"title"];
        [data setObject:@"Mark Twain" forKey:@"author"];
    }
    return self;
}

//全局函数
static void dynamicInstanceMethodIMP(id self, SEL _cmd)
{
    NSLog(@"has get %@",NSStringFromSelector(_cmd));
}

//全局函数
static void dynamicClassMethodIMP(id self, SEL _cmd)
{
    NSLog(@"has get %@",NSStringFromSelector(_cmd));
}

+ (BOOL)resolveInstanceMethod:(SEL)sel
{
    if ([NSStringFromSelector(sel) isEqualToString:@"resolveThisMethodDynamically"]) {
        class_addMethod([self class], sel, (IMP) dynamicInstanceMethodIMP, "v@:");
    }
    
    return [super resolveInstanceMethod:sel];
}

+ (BOOL)resolveClassMethod:(SEL)sel
{
    if ([NSStringFromSelector(sel) isEqualToString:@"resolveThisMethodDynamically"]) {
        class_addMethod([self class], sel, (IMP) dynamicClassMethodIMP, "v@:");
    }
    
    return [super resolveClassMethod:sel];
}

- (id)forwardingTargetForSelector:(SEL)aSelector
{
    NSLog(@"MyTestObject _cmd: %@", NSStringFromSelector(_cmd));
    
    NoneClass *none = [[NoneClass alloc] init];
    if ([none respondsToSelector: aSelector]) {
        return none;
    }
    
    return [super forwardingTargetForSelector: aSelector];
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector
{
    NSString *selStr = NSStringFromSelector(aSelector);
    
    if ([selStr hasPrefix:@"set"]) {
        return [NSMethodSignature signatureWithObjCTypes:"v@:@"];
    }else {
        return [NSMethodSignature signatureWithObjCTypes:"@@:"];
    }
}

- (void)forwardInvocation:(NSInvocation *)anInvocation
{
    NSString *key = NSStringFromSelector([anInvocation selector]);
    if ([key hasPrefix:@"set"]) {
        key = [[key substringWithRange:NSMakeRange(3, [key length]-4)] lowercaseString];
        NSString *obj = nil;
        [anInvocation getArgument:&obj atIndex:2];
        [data setObject:obj forKey:key];
    }else {
        //getter函数就相对简单了，直接把函数名做 key就好了。
        NSString *obj = [data objectForKey:key];
        [anInvocation setReturnValue:&obj];
    }
}

- (void)newDoesNotRecognizeSelector:(SEL)aSelector
{
    NSLog(@"doesNotRecognizeSelector is ...%@",NSStringFromSelector(aSelector));
    [self doesNotRecognizeSelector:aSelector];
}

- (void)doSomething
{
    
}

- (void)newDoSomething
{
    NSLog(@"%@",NSStringFromSelector(_cmd));
}

@end
