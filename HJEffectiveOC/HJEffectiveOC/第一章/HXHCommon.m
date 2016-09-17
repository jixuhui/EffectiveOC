//
//  HXHCommon.m
//  HJEffectiveOC
//
//  Created by Hubbert on 16/8/13.
//  Copyright © 2016年 private. All rights reserved.
//

#import "HXHCommon.h"

@interface HXHCommon()
{
    HXHCommon_TYPE _curType;
}
@end

const float HXHCommonStatus = 0.5f;

@implementation HXHCommon

- (void)doSomething
{
    switch (_curType) {
        case HXHCommon_TYPE_NONE:
        {
            
        }
            break;
        case HXHCommon_TYPE_RICH:
        {
            
        }
            break;
        case HXHCommon_TYPE_SIMPLE:
        {
            
        }
            break;
/*
 在处理枚举类型的switch语句中不要实现default分支。这样的话，加入新枚举之后，编译器就会提示开发者：switch语句并未处理所有枚举。
*/
//        default:
//            break;
    }
}

@end
