//
//  MainInterfaceController+WatchConnectivity.h
//  WatchDemo
//
//  Created by pnam on 28/08/2022.
//

#import "MainInterfaceController.h"
#import "WatchConnectivityManagerDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface MainInterfaceController (WatchConnectivity) <WatchConnectivityManagerDelegate>

@end

NS_ASSUME_NONNULL_END
