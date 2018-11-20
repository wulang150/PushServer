//
//  AppUpdateCheck.h
//  PushServer
//
//  Created by  Tmac on 2017/8/21.
//  Copyright © 2017年 Tmac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppUpdateCheck : NSObject
/*
 appStoreUrl： appStore上的url
 isNeedUpdate：是否需要更新，succ：appStore版本比当前版本号大
 */
+(void)checkAppFromAppStoreWithUrl:(NSString *)appStoreUrl isNeedUpdate:(void(^)(BOOL succ))isNeedUpdate;
@end
