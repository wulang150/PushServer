//
//  ViewController.m
//  PushServer
//
//  Created by  Tmac on 2017/8/21.
//  Copyright © 2017年 Tmac. All rights reserved.
//

#import "ViewController.h"
#import "LocalNotifyManager.h"
#import "AppUpdateCheck.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *testBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnAction:(UIButton *)sender {
    
//    [LocalNotifyManager pushLocalNotification:@"标题" alertBody:@"今天真的没有吃饭" flag:@"my" infoDic:@{@"name":@"hello"}];
    
//    [self performSelector:@selector(delayShow) withObject:nil afterDelay:2];
    switch (sender.tag) {
        case 1:
            
            [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(delayShow) userInfo:nil repeats:NO];
            
//            [self performSelector:@selector(delayShow) withObject:nil afterDelay:2];
            break;
            
        case 2:
            [[LocalNotifyManager sharedInstanced] removeLocalNotification:@"my"];
            break;
        case 3:
        {
            [AppUpdateCheck checkAppFromAppStoreWithUrl:@"http://itunes.apple.com/lookup?id=1097693984" isNeedUpdate:^(BOOL succ) {
                
                if(succ)
                {
                    UIAlertView *alert= [[UIAlertView alloc] initWithTitle:@"更新" message:@"现在进行更新"  delegate:nil  cancelButtonTitle:@"取消" otherButtonTitles:@"更新", nil ];
                    alert.tag = 10;
                    [alert show];
                }
            }];
            break;
        }
        default:
            break;
    }
    
    
    
}

- (void)delayShow
{
    //可以发送前，先清除同一类型通知
//    [LocalNotifyManager removeLocalNotification:@"my"];
    [[LocalNotifyManager sharedInstanced] pushLocalNotification:@"标题" alertBody:@"今天真的没有吃顶顶顶顶单独搜索多咚咚，士大夫似的发多少，似懂非懂是否，似懂非懂是否奋达，深深深，咚的是的范德萨发的饭" flag:@"my" infoDic:@{@"name":@"hello"}];
}
@end
