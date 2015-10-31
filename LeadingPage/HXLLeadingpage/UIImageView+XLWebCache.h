//
//  UIImage+XLWebCache.h
//  XLImagePageDemo
//
//  Created by Eiwodetianna on 9/8/15.
//  Copyright © 2015 jinxinliang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, XLImageCacheType) {
    /**
     * The image wasn't available the SDWebImage caches, but was downloaded from the web.
     */
    XLImageCacheTypeNone,
    /**
     * The image was obtained from the disk cache.
     */
    XLImageCacheTypeDisk,
    /**
     * The image was obtained from the memory cache.
     */
    XLImageCacheTypeMemory
};


@interface UIImageView (XLWebCache)

- (void)xl_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder;

@end
