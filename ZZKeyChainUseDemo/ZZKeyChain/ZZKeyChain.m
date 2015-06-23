//
//  ZZKeyChain.m
//  KeyChainUseDemo
//
//  Created by zezefamily on 15/6/8.
//  Copyright (c) 2015年 zezefamily. All rights reserved.
//

#import "ZZKeyChain.h"
@interface ZZKeyChain ()
{
    NSString *_uuid;
    NSString *_identifier;
    NSString *_accessGroup;
    
    KeychainItemWrapper *_wrapper;
    
}
@end
@implementation ZZKeyChain

- (id)initWithIndentifier:(NSString *)identifier AccessGroup:(NSString *)accessGroup
{
    self = [super init];
    if(self){
        
        _identifier = identifier;
        _accessGroup = accessGroup;
        
        _wrapper = [[KeychainItemWrapper alloc]initWithIdentifier:_identifier accessGroup:_accessGroup];
        
        [self createKeyChain];
        
    }
    return self;
}

- (void)createKeyChain
{
    
    if([[[NSUserDefaults standardUserDefaults]objectForKey:@"isHaveUDID"]boolValue] == NO){
        
        [[NSUserDefaults standardUserDefaults]setBool:YES forKey:@"isHaveUDID"];
        [[NSUserDefaults standardUserDefaults]synchronize];
        
        _uuid = [self Get_UUID];
        NSLog(@"uuid == %@",_uuid);
        [_wrapper setObject:_uuid forKey:(__bridge id)kSecAttrAccount];
        
    }

    
}

- (NSString *)readUDID
{
    NSString *UDID;
    UDID = [_wrapper objectForKey:(__bridge id)(kSecAttrAccount)];
    return UDID;
}


- (void)deleteAllData
{
    [_wrapper resetKeychainItem];
}


#pragma mark - 获取UUID 内部方法
- (NSString *)Get_UUID{
    
    CFUUIDRef puuid = CFUUIDCreate( nil );
    CFStringRef uuidString = CFUUIDCreateString( nil, puuid );
    NSString * result = (NSString *)CFBridgingRelease(CFStringCreateCopy( NULL, uuidString));
    CFRelease(puuid);
    CFRelease(uuidString);
    return result;
}


@end
