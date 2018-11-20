//
//  AppUpdateCheck.m
//  PushServer
//
//  Created by  Tmac on 2017/8/21.
//  Copyright © 2017年 Tmac. All rights reserved.
//

#import "AppUpdateCheck.h"

@implementation AppUpdateCheck

+(void)checkAppFromAppStoreWithUrl:(NSString *)appStoreUrl isNeedUpdate:(void(^)(BOOL succ))isNeedUpdate
{
    NSDictionary *infoDict = [[NSBundle mainBundle] infoDictionary];
    NSString *nowVersion = [infoDict objectForKey:@"CFBundleVersion"]; //当前APP的版本号
    
    NSURL *url = [NSURL URLWithString:appStoreUrl];
    
    NSMutableURLRequest *request= [NSMutableURLRequest requestWithURL:url];
    request.timeoutInterval = 20;
    
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        
        BOOL isNeed = false;
        
        NSInteger responseCode = [(NSHTTPURLResponse *)response statusCode];
        
        if (!connectionError && responseCode == 200)
        {
            
            NSError *error;
            NSDictionary *dict=  [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&error];
            
            NSArray *res= [dict objectForKey:@"results"];
            
            if([res count])
            {
                NSDictionary *resDict= [res objectAtIndex:0];
                
                NSString *newVersion = [resDict objectForKey:@"version"];
//                NSString *releaseNotes = [resDict objectForKey:@"releaseNotes"];
                NSLog(@"%@",resDict);
                
                if([nowVersion compare:newVersion] == NSOrderedAscending)   //当前的版本小余APP Store版本时提示升级
                {
                    isNeed = YES;
                }
            }
            
        }
        else
        {
            NSLog(@"error=%@",connectionError.description);
            
        }
        
        if(isNeedUpdate)
            isNeedUpdate(isNeed);
    }];
    
    
    
}
@end
