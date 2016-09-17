//
//  HXHDesignedInit.m
//  HJEffectiveOC
//
//  Created by Hubbert on 16/9/17.
//  Copyright © 2016年 private. All rights reserved.
//

#import "HXHDesignedInit.h"

@implementation HXHDesignedInit

- (instancetype)init
{
    return [self initWithData:nil];
}

- (instancetype)initWithData:(id)data
{
    self = [super init];
    if (self) {
        NSLog(@"data...%@",data);
    }
    
    return self;
}

@end
