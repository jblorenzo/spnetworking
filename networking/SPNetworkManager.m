//
//  SPNetworkManager.m
//  networking
//
//  Created by John Bennedict Lorenzo on 2/1/13.
//  Copyright (c) 2013 Stratpoint. All rights reserved.
//

#import "SPNetworkManager.h"
#import "SPNetworkFetcher.h"

@implementation SPNetworkManager

+ (SPNetworkManager *)defaultNetworkManager
{
    SPNetworkManager *_sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[self alloc] init];
    });
    
    return _sharedInstance;
}


- (void)fetch:(NSString *)aURLString
    onSuccess:(void(^)(id data))success
    onFailure:(void(^)(NSError *error))failure
{

    // <Insert code for checking cached data here>
    
    [[SPNetworkFetcher defaultNetworkFetcher] fetch:aURLString
                                          onSuccess:success // <Insert code for parsing here>
                                          onFailure:failure];
}

@end
