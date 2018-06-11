//
//  Network.m
//  MLTestApp
//
//  Created by Rhonny Gonzalez on 10/6/18.
//  Copyright © 2018 Rhonny Gonzalez. All rights reserved.
//

#import "Network.h"

@implementation Network

    - (void)getRequestDataWithURL:(NSString *)url requestName:(NSString *)requestName callback:(void (^)(NSURLResponse *, id, NSError *))callback
    {
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        
        AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
        
        NSURL *URL = [NSURL URLWithString:url];
        NSURLRequest *request = [NSURLRequest requestWithURL:URL];
        
        NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
            
            callback(response,responseObject,error);

        }];
        [dataTask resume];
    }
    
@end
