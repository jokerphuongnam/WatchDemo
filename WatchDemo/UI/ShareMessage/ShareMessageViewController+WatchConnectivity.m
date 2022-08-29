//
//  ShareMessageViewController+WatchConnectivity.m
//  WatchDemo
//
//  Created by pnam on 28/08/2022.
//

#import "ShareMessageViewController+WatchConnectivity.h"

#pragma mark - WatchConnectivityManagerDelegate
@implementation ShareMessageViewController (WatchConnectivity)
- (void)watchConnectivity:(WatchConnectivityManager *)manager session:(WCSession *)session activationDidCompleteWithState:(WCSessionActivationState)activationState error:(NSError *)error {
    
}

- (void)watchConnectivity:(WatchConnectivityManager *)manager didBecomeInactive:(WCSession *)session {
    
}

- (void)watchConnectivity:(WatchConnectivityManager *)manager didDeactivate:(WCSession *)session {
    
}

- (void)watchConnectivity:(WatchConnectivityManager *)manager session:(WCSession *)session didReceiveMessage:(NSDictionary<NSString *,id> *)message {
    NSLog(@"%@", message[WatchConnectivityManager.messageKey]);
    dispatch_async(dispatch_get_main_queue(), ^{
        self.errorLabel.text = message[WatchConnectivityManager.messageKey];
    });
}

- (void)watchConnectivity:(WatchConnectivityManager *)manager session:(WCSession *)session didReceiveMessage:(NSDictionary<NSString *,id> *)message replyHandler:(void (^)(NSDictionary<NSString *,id> * _Nonnull))replyHandler {
    NSLog(@"%@", message[WatchConnectivityManager.messageKey]);
    dispatch_async(dispatch_get_main_queue(), ^{
        self.errorLabel.text = message[WatchConnectivityManager.messageKey];
    });
}
@end
