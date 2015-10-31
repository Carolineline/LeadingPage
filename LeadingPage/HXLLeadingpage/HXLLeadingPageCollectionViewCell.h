//
//  HXLLeadingPageCollectionViewCell.h
//  LeadingPage
//
//  Created by 晓琳 on 15/10/19.
//  Copyright (c) 2015年 晓琳. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^MyDataBlock) (id dataBlock);


@protocol HXLImageLeadingPageCellDelegate <NSObject>

- (void) ImageLeadingPageCellDidSelectedWith:(NSInteger)cellInedex;
- (void) pushMainPageView;

@end

@interface HXLLeadingPageCollectionViewCell : UICollectionViewCell

@property (nonatomic,retain) UIScrollView *scrollView;

@property (nonatomic, retain) UIImageView *pageImageView;
@property (nonatomic, retain) UIButton *button;
@property (nonatomic, retain) UILabel *nameLable;
@property (nonatomic, assign) id<HXLImageLeadingPageCellDelegate>myDelegate;

@end
