//
//  SPNetworkCache.m
//  networking
//
//  Created by John Bennedict Lorenzo on 2/1/13.
//  Copyright (c) 2013 Stratpoint. All rights reserved.
//

#import "SPNetworkCache.h"

@interface SPNetworkCache ()
{
    
}

@end

@implementation SPNetworkCache

+ (SPNetworkCache *)defaultNetworkCache
{
    SPNetworkCache *_sharedInstance = nil;
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
        
    }
    
    return self;
}

@end
