//
//  ZZKeyChain.h
//  KeyChainUseDemo
//
//  Created by zezefamily on 15/6/8.
//  Copyright (c) 2015年 zezefamily. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KeychainItemWrapper.h"
@interface ZZKeyChain : NSObject


/***
 初始化 获取并保持UDID
 @function 在应用启动后初始化 获取UDID
 @param identifier ,such as @"HMSG"
 @param accessGroup ,such as @"7644648.com.YJKSecond.HMSG"
 */
- (id)initWithIndentifier:(NSString *)identifier AccessGroup:(NSString *)accessGroup;

/***
 读取UDID
 @return UDID字符串(NSString类型)
 */
- (NSString *)readUDID;

/***
 清空保存的数据
 @return nil
 */
- (void)deleteAllData;

@end
