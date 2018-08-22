//
//  DownloadManager.m
//  Giphy
//
//  Created by Viktar Semianchuk on 8/22/18.
//  Copyright © 2018 Viktar Semianchuk. All rights reserved.
//

#import "DownloadManager.h"

@implementation DownloadManager

- (void)fetchDataFromURL:(NSString *)stringUrl withCompletionBlock:(void (^)(NSData *))completionBlock {
//    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//    dispatch_async(queue, ^{
//        NSURL *url = [NSURL URLWithString:stringUrl];
//        NSData *data = [NSData dataWithContentsOfURL:url];
//        dispatch_async(dispatch_get_main_queue(), ^{
//            completionBlock(data);
//        });
//    });
    
    NSURLRequest* request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:stringUrl] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20];
    
    NSURLSessionConfiguration* configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    configuration.waitsForConnectivity = YES;
    configuration.allowsCellularAccess = YES;
    
    NSURLSession* session = [NSURLSession sessionWithConfiguration: configuration];
    NSURLSessionDataTask* task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        dispatch_async(dispatch_get_global_queue(QOS_CLASS_UTILITY, 0), ^{
            completionBlock(data);
        });
    }];
    
    [task resume];
}

@end
