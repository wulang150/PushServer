//
//  AppDelegate-Jpush.h
//  Runner
//
//  Created by  Tmac on 16/3/30.
//  Copyright © 2016年 Janson. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate (Jpush)
/*
 * @param launchingOption 启动参数.
 * @param appKey 一个JPush 应用必须的,唯一的标识. 请参考 JPush 相关说明文档来获取这个标识.
 * @param channel 发布渠道. 可选.
 * @param isProduction 是否生产环境. 如果为开发状态,设置为 NO; 如果为生产状态,应改为 YES.
 */
-(void)setupWithOption:(NSDictionary *)launchingOption appKey:(NSString *)appKey channel:(NSString *)channel apsForProduction:(BOOL)isProduction;
@end
