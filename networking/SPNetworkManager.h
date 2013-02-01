//
//  SPNetworkManager.h
//  networking
//
//  Created by John Bennedict Lorenzo on 2/1/13.
//  Copyright (c) 2013 Stratpoint. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SPNetworkManager : NSObject

+ (SPNetworkFetcher *)defaultNetworkManager;

- (void)fetch:(NSString *)aURLString
    onSuccess:(void(^)(id data))success
    onFailure:(void(^)(NSError *error))failure;

@end
