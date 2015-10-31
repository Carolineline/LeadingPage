//
//  HXLLeadingPageCollectionViewCell.m
//  LeadingPage
//
//  Created by 晓琳 on 15/10/19.
//  Copyright (c) 2015年 晓琳. All rights reserved.
//

#import "HXLLeadingPageCollectionViewCell.h"

@interface HXLLeadingPageCollectionViewCell ()<UIScrollViewDelegate>
@property (nonatomic, assign) BOOL showButtonTitle;
    

@end

@implementation HXLLeadingPageCollectionViewCell

-(instancetype) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createSubviews];
    }
    return self;
}

-(void) createSubviews
{
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.contentView.frame];
    
    _scrollView.delegate = self;
    _scrollView.bounces = NO;
    _scrollView.showsHorizontalScrollIndicator = NO;
    [self.contentView addSubview:_scrollView];
    
    self.pageImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)];
    [self.scrollView addSubview:self.pageImageView];
    self.nameLable = [[UILabel alloc] initWithFrame:CGRectMake(0, self.bounds.size.height- 30, self.bounds.size.width, 30)];
    [self.scrollView addSubview:self.nameLable];
//    self.nameLable.text = @"next";
    
    
    self.nameLable.textAlignment = 1;
    NSLog(@"tag = %ld",self.tag);
    if (self.tag == 0) {
        self.button = [UIButton buttonWithType:UIButtonTypeCustom];
        self.button.frame = CGRectMake(130, 270, 100 , 30);
        [self.button addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
//        [self.button setTitle:@"立即进入" forState:UIControlStateNormal];
        [self.contentView addSubview:self.button];
        
    }
    
    
}


-(void)btnAction:(UIButton *)btn
{
    [self.myDelegate ImageLeadingPageCellDidSelectedWith:self.tag - 1000];

    [self.myDelegate pushMainPageView];
        
}
@end
