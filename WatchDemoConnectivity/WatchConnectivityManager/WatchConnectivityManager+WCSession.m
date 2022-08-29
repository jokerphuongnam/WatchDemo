//
//  WatchConnectivityManager+WCSessionDelegate.m
//  WatchDemo
//
//  Created by pnam on 28/08/2022.
//

#import "WatchConnectivityManager+WCSession.h"
#import "WatchConnectivity/WatchConnectivity.h"

#pragma mark - WCSessionDelegate
@implementation WatchConnectivityManager (WCSession)

- (void)session:(nonnull WCSession *)session activationDidCompleteWithState:(WCSessionActivationState)activationState error:(nullable NSError *)error {
    
}

- (void)sessionDidBecomeInactive:(nonnull WCSession *)session {
    
}

- (void)sessionDidDeactivate:(nonnull WCSession *)session {
    
}

@end
