//
//  HXHCommon.h
//  HJEffectiveOC
//
//  Created by Hubbert on 16/8/13.
//  Copyright © 2016年 private. All rights reserved.
//

#import <Foundation/Foundation.h>

extern const float HXHCommonStatus;

typedef NS_OPTIONS(NSUInteger, HXHCommon_FLAG)
{
    HXHCommon_FLAG_LEFT = 0,
    HXHCommon_FLAG_RIGHT = 1 << 1,
    HXHCommon_FLAG_UP = 1 << 2,
    HXHCommon_FLAG_DOWN = 1 << 3
};

typedef NS_ENUM(NSUInteger,HXHCommon_TYPE)
{
    HXHCommon_TYPE_NONE = 0,
    HXHCommon_TYPE_RICH,
    HXHCommon_TYPE_SIMPLE
};

@interface HXHCommon : NSObject

@end
