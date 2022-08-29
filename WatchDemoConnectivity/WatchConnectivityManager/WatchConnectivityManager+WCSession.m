//
//  WatchConnectivityManager+WCSession.m
//  WatchDemo
//
//  Created by pnam on 28/08/2022.
//

#import "WatchConnectivityManager+WCSession.h"
#import "WatchConnectivity/WatchConnectivity.h"
#import "WatchConnectivityManagerDelegate.h"

@interface WatchConnectivityManager (WCSession) <WCSessionDelegate>
@property(nonnull, strong, nonatomic) NSMutableArray<id<WatchConnectivityManagerDelegate>> *delegates;
@end

#pragma mark - WCSessionDelegate
@implementation WatchConnectivityManager (WCSession)
NSMutableArray<id<WatchConnectivityManagerDelegate>> *__delegates = nil;
- (NSMutableArray<id<WatchConnectivityManagerDelegate>> *)delegates {
    @synchronized([WatchConnectivityManager class]) {
        if (!__delegates)
            __delegates = [[NSMutableArray alloc] init];
        return __delegates;
    }
    return  __delegates;
}

- (id<WatchConnectivityManagerDelegate>)delegate {
    return self.delegates.count == 0 ? nil : self.delegates[0];
}

- (void)setDelegate:(id<WatchConnectivityManagerDelegate>)delegate {
    @synchronized([WatchConnectivityManager class]) {
        [self.delegates addObject:delegate];
    }
}

- (void)removeDelegate:(nonnull id<WatchConnectivityManagerDelegate>)delegate {
    @synchronized([WatchConnectivityManager class]) {
        [self.delegates removeObject:delegate];
    }
}

- (void)session:(nonnull WCSession *)session activationDidCompleteWithState:(WCSessionActivationState)activationState error:(nullable NSError *)error {
    for (id<WatchConnectivityManagerDelegate> delegate in self.delegates) {
        [delegate watchConnectivity:self session:session activationDidCompleteWithState:activationState error:error];
    }
}

#if TARGET_OS_IOS
- (void)sessionDidBecomeInactive:(nonnull WCSession *)session {
    for (id<WatchConnectivityManagerDelegate> delegate in self.delegates) {
        [delegate watchConnectivity:self didBecomeInactive:session];
    }
}

- (void)sessionDidDeactivate:(nonnull WCSession *)session {
    [self active];
    for (id<WatchConnectivityManagerDelegate> delegate in self.delegates) {
        [delegate watchConnectivity:self didDeactivate:session];
    }
}

- (void)sessionWatchStateDidChange:(WCSession *)session {
    for (id<WatchConnectivityManagerDelegate> delegate in self.delegates) {
        [delegate watchConnectivity:self watchStateDidChange:session];
    }
}

#elif TARGET_OS_WATCH
- (void)sessionCompanionAppInstalledDidChange:(WCSession *)session {
    for (id<WatchConnectivityManagerDelegate> delegate in self.delegates) {
        [delegate watchConnectivity:self companionAppInstalledDidChange:session];
    }
}
#endif

- (void)sessionReachabilityDidChange:(WCSession *)session {
    for (id<WatchConnectivityManagerDelegate> delegate in self.delegates) {
        if (![delegate respondsToSelector:@selector(watchConnectivity:reachabilityDidChange:)]) {
            continue;
        }
        [delegate watchConnectivity:self reachabilityDidChange:session];
    }
}

- (void)session:(WCSession *)session didReceiveMessage:(NSDictionary<NSString *, id> *)message  {
    for (id<WatchConnectivityManagerDelegate> delegate in self.delegates) {
        if (![delegate respondsToSelector:@selector(watchConnectivity:session:didReceiveMessage:)]) {
            continue;
        }
        [delegate watchConnectivity:self session:session didReceiveMessage:message];
    }
}

- (void)session:(WCSession *)session didReceiveMessage:(NSDictionary<NSString *, id> *)message replyHandler:(void(^)(NSDictionary<NSString *, id> *replyMessage))replyHandler {
    for (id<WatchConnectivityManagerDelegate> delegate in self.delegates) {
        if (![delegate respondsToSelector:@selector(watchConnectivity:session:didReceiveMessage:replyHandler:)]) {
            continue;
        }
        [delegate watchConnectivity:self session:session didReceiveMessage:message replyHandler:replyHandler];
    }
}

- (void)session:(WCSession *)session didReceiveMessageData:(NSData *)messageData {
    for (id<WatchConnectivityManagerDelegate> delegate in self.delegates) {
        if (![delegate respondsToSelector:@selector(watchConnectivity:session:didReceiveMessageData:)]) {
            continue;
        }
        [delegate watchConnectivity:self session:session didReceiveMessageData:messageData];
    }
}

- (void)session:(WCSession *)session didReceiveMessageData:(NSData *)messageData replyHandler:(void(^)(NSData *replyMessageData))replyHandler {
    for (id<WatchConnectivityManagerDelegate> delegate in self.delegates) {
        if (![delegate respondsToSelector:@selector(watchConnectivity:session:didReceiveMessageData:replyHandler:)]) {
            continue;
        }
        [delegate watchConnectivity:self session:session didReceiveMessageData:messageData replyHandler:replyHandler];
    }
}

- (void)session:(WCSession *)session didReceiveApplicationContext:(NSDictionary<NSString *, id> *)applicationContext {
    for (id<WatchConnectivityManagerDelegate> delegate in self.delegates) {
        if (![delegate respondsToSelector:@selector(watchConnectivity:session:didReceiveApplicationContext:)]) {
            continue;
        }
        [delegate watchConnectivity:self session:session didReceiveApplicationContext:applicationContext];
    }
}

- (void)session:(WCSession * __nonnull)session didFinishUserInfoTransfer:(WCSessionUserInfoTransfer *)userInfoTransfer error:(nullable NSError *)error {
    for (id<WatchConnectivityManagerDelegate> delegate in self.delegates) {
        if (![delegate respondsToSelector:@selector(watchConnectivity:session:didFinishUserInfoTransfer:error:)]) {
            continue;
        }
        [delegate watchConnectivity:self session:session didFinishUserInfoTransfer:userInfoTransfer error:error];
    }
}

- (void)session:(WCSession *)session didReceiveUserInfo:(NSDictionary<NSString *, id> *)userInfo {
    for (id<WatchConnectivityManagerDelegate> delegate in self.delegates) {
        if (![delegate respondsToSelector:@selector(watchConnectivity:session:didReceiveUserInfo:)]) {
            continue;
        }
        [delegate watchConnectivity:self session:session didReceiveUserInfo:userInfo];
    }
}

- (void)session:(WCSession *)session didFinishFileTransfer:(WCSessionFileTransfer *)fileTransfer error:(nullable NSError *)error {
    for (id<WatchConnectivityManagerDelegate> delegate in self.delegates) {
        if (![delegate respondsToSelector:@selector(watchConnectivity:session:didFinishFileTransfer:error:)]) {
            continue;
        }
        [delegate watchConnectivity:self session:session didFinishFileTransfer:fileTransfer error:error];
    }
}

- (void)session:(WCSession *)session didReceiveFile:(WCSessionFile *)file {
    for (id<WatchConnectivityManagerDelegate> delegate in self.delegates) {
        if (![delegate respondsToSelector:@selector(watchConnectivity:session:didReceiveFile:)]) {
            continue;
        }
        [delegate watchConnectivity:self session:session didReceiveFile:file];
    }
}
@end
