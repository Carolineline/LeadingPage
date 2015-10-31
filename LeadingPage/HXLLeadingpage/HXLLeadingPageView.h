//
//  HXLLeadingPageView.h
//  LeadingPage
//
//  Created by 晓琳 on 15/10/19.
//  Copyright (c) 2015年 晓琳. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HXLLeadingPageView;
@protocol PageLeadingDelegate <NSObject>

@optional

-(void) ImageView:(HXLLeadingPageView *)leagingPage didSelectPageAtIndex:(NSInteger)pageIndex;
-(void)pushViewController;

@end

@interface HXLLeadingPageView : UIView

//@property (nonatomic, retain) NSArray *imageArray;
@property (nonatomic, retain) NSArray *LeadImageArray;

@property (nonatomic, assign) id<PageLeadingDelegate> myDelegate;

@end
