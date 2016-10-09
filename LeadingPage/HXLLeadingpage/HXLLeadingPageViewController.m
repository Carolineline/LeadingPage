//
//  HXLLeadingPageViewController.m
//  LeadingPage
//
//  Created by 晓琳 on 15/10/19.
//  Copyright (c) 2015年 晓琳. All rights reserved.
//

#import "HXLLeadingPageViewController.h"
#import "HXLLeadingPageView.h"
#import "ViewController.h"

@interface HXLLeadingPageViewController ()<PageLeadingDelegate>

@property (nonatomic, retain) NSArray *array;

@end

@implementation HXLLeadingPageViewController

//- (void)dealloc {
//    [_array release];
//    Block_release(_pushBlock);
//    [super dealloc];
//}

+ (instancetype)hxlLeadingPageWithArray:(NSArray *)array andAction:(PushBlock)action {
    
    
    HXLLeadingPageViewController *hxlLeadingPageVC = [[HXLLeadingPageViewController alloc] initWithArray:array andAction:^{
        action();
    }];
    
    if (hxlLeadingPageVC) {
            [hxlLeadingPageVC createSubviewsArray:array andAction:^{
                action();
            }];
    }
    return hxlLeadingPageVC;
}

- (instancetype)initWithArray:(NSArray *)array andAction:(PushBlock)action {
    self = [super init];
    if (self) {
        [self createSubviewsArray:array andAction:^{
            action();
        }];
    }
    return self;
}

- (void)createSubviewsArray:(NSArray *)array andAction:(PushBlock)action{
    self.pushBlock = action;
    self.array = array;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.translucent = NO;
    
    HXLLeadingPageView *pageView = [[HXLLeadingPageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    pageView.myDelegate = self;
    
    pageView.LeadImageArray = self.array;
    [self.view addSubview:pageView];
    
}


-(void)ImageView:(HXLLeadingPageView *)leagingPage didSelectPageAtIndex:(NSInteger)pageIndex
{
    NSLog(@"%ld",pageIndex);
}

//实现点击button协议方法
-(void) pushViewController
{
    self.pushBlock();
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
