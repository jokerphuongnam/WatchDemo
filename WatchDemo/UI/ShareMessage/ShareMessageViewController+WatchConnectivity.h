//
//  ShareMessageViewController+WatchConnectivity.h
//  WatchDemo
//
//  Created by pnam on 28/08/2022.
//

#import "ShareMessageViewController.h"
#import "WatchConnectivityManagerDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface ShareMessageViewController (WatchConnectivity) <WatchConnectivityManagerDelegate>

@end

NS_ASSUME_NONNULL_END
