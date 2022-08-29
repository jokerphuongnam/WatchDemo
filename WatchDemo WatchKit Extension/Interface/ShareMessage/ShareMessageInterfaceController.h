//
//  ShareMessageInterfaceController.h
//  WatchDemo WatchKit Extension
//
//  Created by pnam on 29/08/2022.
//

#import <WatchKit/WatchKit.h>
#import "WatchConnectivityManager.h"
#import "WatchConnectivityManagerDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface ShareMessageInterfaceController : WKInterfaceController
@property (weak, nonatomic) IBOutlet WKInterfaceLabel *messageLabel;
@property (nonatomic, assign, readonly) WatchConnectivityManager *watchConnectivity;
@end

NS_ASSUME_NONNULL_END
