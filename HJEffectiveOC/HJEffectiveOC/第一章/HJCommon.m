//
//  HJCommon.m
//  HJEffectiveOC
//
//  Created by Hubbert on 16/8/13.
//  Copyright © 2016年 private. All rights reserved.
//

#import "HJCommon.h"

@interface HJCommon()
{
    HJCOMMON_TYPE _curType;
}
@end

const float HJCommonStatus = 0.5f;

@implementation HJCommon

- (void)doSomething
{
    switch (_curType) {
        case HJCOMMON_TYPE_NONE:
        {
            
        }
            break;
        case HJCOMMON_TYPE_RICH:
        {
            
        }
            break;
        case HJCOMMON_TYPE_SIMPLE:
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
