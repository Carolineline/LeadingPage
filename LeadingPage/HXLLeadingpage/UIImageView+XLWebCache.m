//
//  UIImage+XLWebCache.m
//  XLImagePageDemo
//
//  Created by Eiwodetianna on 9/8/15.
//  Copyright © 2015 jinxinliang. All rights reserved.
//

#import "UIImageView+XLWebCache.h"

@implementation UIImageView (XLWebCache)

- (void)xl_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder {
    self.image = placeholder;
    [self downloadImageWithImageUrl:url];
    
    

}


- (void)downloadImageWithImageUrl:(NSURL *)url {
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestReturnCacheDataElseLoad timeoutInterval:60.f];
    [request setHTTPMethod:@"GET"];
    NSURLCache *cache = [NSURLCache sharedURLCache];
        //获取缓存
    NSCachedURLResponse * response = [cache cachedResponseForRequest:request];
    if (response.data) {
        
        self.image = [UIImage imageWithData:response.data];
        [self setNeedsDisplay];
    } else {
        [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
            if (data) {
                UIImage *image = [UIImage imageWithData:data];
                self.image = image;
                [self setNeedsDisplay];
            }
        }];
    
    }
    

    
}

@end
