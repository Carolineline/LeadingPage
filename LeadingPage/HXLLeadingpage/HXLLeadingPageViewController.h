//
//  HXLLeadingPageViewController.h
//  LeadingPage
//
//  Created by 晓琳 on 15/10/19.
//  Copyright (c) 2015年 晓琳. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^PushBlock)(void);

@interface HXLLeadingPageViewController : UIViewController

+ (instancetype)hxlLeadingPageWithArray:(NSArray *)array andAction:(PushBlock)action;
- (instancetype)initWithArray:(NSArray *)array andAction:(PushBlock)action;

@property (nonatomic, copy) PushBlock pushBlock;

@end
