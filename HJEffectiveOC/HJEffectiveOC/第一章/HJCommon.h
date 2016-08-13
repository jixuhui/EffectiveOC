//
//  HJCommon.h
//  HJEffectiveOC
//
//  Created by Hubbert on 16/8/13.
//  Copyright © 2016年 private. All rights reserved.
//

#import <Foundation/Foundation.h>

extern const float HJCommonStatus;

typedef NS_OPTIONS(NSUInteger, HJCOMMON_FLAG)
{
    HJCOMMON_FLAG_LEFT = 0,
    HJCOMMON_FLAG_RIGHT = 1 << 1,
    HJCOMMON_FLAG_UP = 1 << 2,
    HJCOMMON_FLAG_DOWN = 1 << 3
};

typedef NS_ENUM(NSUInteger,HJCOMMON_TYPE)
{
    HJCOMMON_TYPE_NONE = 0,
    HJCOMMON_TYPE_RICH,
    HJCOMMON_TYPE_SIMPLE
};

@interface HJCommon : NSObject

@end
