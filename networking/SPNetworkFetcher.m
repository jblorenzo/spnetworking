//
//  SPNetworkFetcher.m
//  networking
//
//  Created by John Bennedict Lorenzo on 2/1/13.
//  Copyright (c) 2013 Stratpoint. All rights reserved.
//

#import "SPNetworkFetcher.h"

NSString *const kNetworkFetcherInNotification = @"SPNetworkFetcherInNotification";
NSString *const kNetworkFetcherOutNotification = @"SPNetworkFetcherOutNotification";

NSString *const kSPNetworkFetcherRequest    = @"SPNetworkFetcherRequest";
NSString *const kSPNetworkFetcherURL        = @"SPNetworkFetcherURL";
NSString *const kSPNetworkFetcherURLString  = @"SPNetworkFetcherURLString";

static NSUInteger const kDefaultMaxConcurrentOperationCount = 1;

@interface SPNetworkFetcher ()
{
    NSOperationQueue *_queue;
}

@end

@implementation SPNetworkFetcher

+ (SPNetworkFetcher *)defaultNetworkFetcher
{
    SPNetworkFetcher *_sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[self alloc] init];
    });
    
    return _sharedInstance;
}

- (id)init
{
    self = [super init];
    if (self) {
        _queue = [[NSOperationQueue alloc] init];
        _queue.name = @"SPNetworkingFetcherQueue";
        _queue.maxConcurrentOperationCount = kDefaultMaxConcurrentOperationCount;

        _inQueue = [[NSOperationQueue alloc] init];
        _inQueue.name = @"SPNetworkingFetcherInQueue";
        _inQueue.maxConcurrentOperationCount = kDefaultMaxConcurrentOperationCount;        
    }
    
    return self;
}

- (void)fetch:(NSString *)aURLString
    onSuccess:(void(^)(id data))success
    onFailure:(void(^)(NSError *error))failure
{
    [_queue addOperationWithBlock:^{
        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:aURLString]];
        NSURLResponse *response = nil;
        NSError *error = nil;
                
        NSData *data = [NSURLConnection sendSynchronousRequest:request
                                             returningResponse:&response
                                                         error:&error];
        if (!error && data) {
            success(data);
        } else {
            failure(error);
        }
    }];
}

@end
