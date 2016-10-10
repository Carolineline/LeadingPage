//
//  HXLLeadingPageView.m
//  LeadingPage
//
//  Created by 晓琳 on 15/10/19.
//  Copyright (c) 2015年 晓琳. All rights reserved.
//

#import "HXLLeadingPageView.h"
#import "HXLLeadingPageCollectionViewCell.h"
#import "UIImageView+XLWebCache.h"


@interface HXLLeadingPageView ()<UICollectionViewDataSource, UICollectionViewDelegate,HXLImageLeadingPageCellDelegate,UICollectionViewDelegateFlowLayout>

@property (nonatomic, retain) UICollectionView *collectionView;

@end

@implementation HXLLeadingPageView


-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super  initWithFrame:frame];
    if (self) {
        [self createSubviews];
        
    }
    return self;
}


-(void) createSubviews
{
//    self.LeadImageArray = [NSArray array];
    
    UICollectionViewFlowLayout *folwlayout = [[UICollectionViewFlowLayout alloc] init];
    folwlayout.itemSize= self.bounds.size;
    folwlayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    folwlayout.minimumInteritemSpacing = 0;
    folwlayout.minimumLineSpacing = 0;
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:folwlayout];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.collectionView];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.pagingEnabled = YES;
    self.collectionView.bounces = NO;
    [self.collectionView registerClass:[HXLLeadingPageCollectionViewCell class] forCellWithReuseIdentifier:@"leadindPageresure"];
   NSLog(@"view");
    
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSLog(@"hhhh = %ld",self.LeadImageArray.count);
    return self.LeadImageArray.count;
}

-(void)setLeadImageArray:(NSMutableArray *)LeadImageArray
{
    //给图片赋值
    
    if (_LeadImageArray != LeadImageArray) {
        _LeadImageArray = [LeadImageArray mutableCopy];
    NSLog(@"llll = %@",LeadImageArray);
    }
    [self.collectionView reloadData];

}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"cell");
    
    HXLLeadingPageCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"leadindPageresure" forIndexPath:indexPath];
    cell.myDelegate =self;
    if (indexPath.row == _LeadImageArray.count -1) {
        cell.lastPage = _LeadImageArray.count -1;
        
    }
    NSLog(@"cell.lastPage = %ld",(long)cell.lastPage);
    
    if ([_LeadImageArray[indexPath.row] isKindOfClass:[NSString class]]) {
        if ([_LeadImageArray[indexPath.row] hasPrefix:@"http"]) {
            [cell.pageImageView xl_setImageWithURL:[NSURL URLWithString:[_LeadImageArray objectAtIndex:indexPath.row]] placeholderImage:nil];
        }else if ([_LeadImageArray[indexPath.row] hasPrefix:@"/"]||[_LeadImageArray[indexPath.item] hasPrefix:@"file"])
        {
            cell.pageImageView.image = [UIImage imageWithContentsOfFile:_LeadImageArray[indexPath.row]];
            
        }else
        {
            cell.pageImageView.image = [UIImage imageNamed:_LeadImageArray [indexPath.row]];
        }
    }else if ([_LeadImageArray[indexPath.item] isKindOfClass:[NSURL class]])
    {
        [cell.pageImageView xl_setImageWithURL:_LeadImageArray [indexPath.item] placeholderImage:nil];
    }else if ([_LeadImageArray [indexPath.item] isKindOfClass:[UIImage class]])
    {
        cell.pageImageView.image = [UIImage imageNamed:self.LeadImageArray [indexPath.item]];
    }

    
    return cell;
}

//滑动计算偏移坐标
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat shift = scrollView.contentOffset.x;//偏移量
    NSLog(@"shift = %f",shift);
    NSLog(@"scrollView.contentSize.width = %f --- %f",scrollView.contentSize.width,[UIScreen mainScreen].bounds.size.width);
    if (shift >= 0 && shift <= scrollView.contentSize.width - [UIScreen mainScreen].bounds.size.width) {
        //角标
        NSIndexPath *previousIndexPath = [NSIndexPath indexPathForItem:scrollView.contentOffset.x/[UIScreen mainScreen].bounds.size.width inSection:0];
        NSIndexPath *nextIndexPath = [NSIndexPath indexPathForItem:scrollView.contentOffset.x/[UIScreen mainScreen].bounds.size.width + 1 inSection:0];
        //取出对应的cell
        HXLLeadingPageCollectionViewCell *previousCell = (HXLLeadingPageCollectionViewCell *)[self.collectionView cellForItemAtIndexPath:previousIndexPath];
        HXLLeadingPageCollectionViewCell *nextCell = (HXLLeadingPageCollectionViewCell *)[self.collectionView cellForItemAtIndexPath:nextIndexPath];
        
       //计算item起点坐标
        CGRect previousImageViewRect = previousCell.pageImageView.frame;
//        NSLog(@"x1 = %f",previousImageViewRect.origin.x);
        CGRect nextImageViewRect = nextCell.pageImageView.frame;
//        NSLog(@"x2 = %f",nextImageViewRect.origin.x);
        
        //计算移动的位置x

        
        previousImageViewRect.origin.x = 0 + (shift - previousIndexPath.item * [UIScreen mainScreen].bounds.size.width) / 3;
        //        NSLog(@"contentImageViewRect.origin.x = %f",contentImageViewRect.origin.x);
        nextImageViewRect.origin.x = 0 - [UIScreen mainScreen].bounds.size.width / 3 + (shift - previousIndexPath.item * [UIScreen mainScreen].bounds.size.width) / 3;
        
        //确定移动时的坐标
        previousCell.pageImageView.frame = previousImageViewRect;
        nextCell.pageImageView.frame = nextImageViewRect;
    }
    
}

//实现协议方法
- (void) ImageLeadingPageCellDidSelectedWith:(NSInteger)cellInedex
{
    if ([self.myDelegate respondsToSelector:@selector(ImageView:didSelectPageAtIndex:)]) {
        [self.myDelegate ImageView:self didSelectPageAtIndex:cellInedex];
    }
}

-(void)pushMainPageView
{
    [self.myDelegate pushViewController];
}
@end
