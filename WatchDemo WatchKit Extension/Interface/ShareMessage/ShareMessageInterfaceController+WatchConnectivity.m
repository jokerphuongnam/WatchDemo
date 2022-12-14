//
//  ShareMessageInterfaceController+WatchConnectivity.m
//  WatchDemo
//
//  Created by pnam on 28/08/2022.
//

#import "ShareMessageInterfaceController+WatchConnectivity.h"

#pragma mark - WatchConnectivityManagerDelegate
@implementation ShareMessageInterfaceController (WatchConnectivity)
- (void)watchConnectivity:(nonnull WatchConnectivityManager *)manager session:(nonnull WCSession *)session activationDidCompleteWithState:(WCSessionActivationState)activationState error:(nullable NSError *)error {
    
}

- (void)watchConnectivity:(WatchConnectivityManager *)manager session:(WCSession *)session didReceiveMessage:(NSDictionary<NSString *,id> *)message {
    [self.watchConnectivity active];
    dispatch_async(dispatch_get_main_queue(), ^{
        self.messageLabel.text = message[WatchConnectivityManager.messageKey];
    });
}

- (void)watchConnectivity:(WatchConnectivityManager *)manager session:(WCSession *)session didReceiveMessage:(NSDictionary<NSString *,id> *)message replyHandler:(void (^)(NSDictionary<NSString *,id> * _Nonnull))replyHandler {
    [self.watchConnectivity active];
    dispatch_async(dispatch_get_main_queue(), ^{
        self.messageLabel.text = message[WatchConnectivityManager.messageKey];
    });
}
@end
