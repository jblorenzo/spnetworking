//
//  SPNetworkFetcher.h
//  networking
//
//  Created by John Bennedict Lorenzo on 2/1/13.
//  Copyright (c) 2013 Stratpoint. All rights reserved.
//

#import <UIKit/UIKit.h>

extern NSString *const kNetworkFetcherInNotification;
extern NSString *const kNetworkFetcherOutNotification;

extern NSString *const kSPNetworkFetcherRequest;
extern NSString *const kSPNetworkFetcherURL;
extern NSString *const kSPNetworkFetcherURLString;

@interface SPNetworkFetcher : NSObject

@property (nonatomic,assign) NSUInteger maxConcurrentOperationCount;

+ (SPNetworkFetcher *)defaultNetworkFetcher;

- (void)fetchUrl:(NSString *)url
          target:(id)target
        selector:(SEL)selector;

@end