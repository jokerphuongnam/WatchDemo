//
//  WatchConnectivityManager.m
//  WatchDemo
//
//  Created by pnam on 28/08/2022.
//

#import "WatchConnectivityManager.h"
#import "WatchConnectivityManager+WCSession.h"
#import "WatchConnectivityManagerDelegate.h"

@interface WatchConnectivityManager ()
@property (nonatomic, assign, readonly) WCSession *session;
@end

@implementation WatchConnectivityManager
static WatchConnectivityManager * _shared = nil;

+ (WatchConnectivityManager *)shared {
    @synchronized([WatchConnectivityManager class]) {
        if (!_shared)
            _shared = [[self alloc] init];
        return _shared;
    }
    return _shared;
}

+ (NSString *)messageKey {
    return @"message";
}

WCSession *__session = nil;

- (instancetype)init {
    self = [super init];
    if ([WCSession isSupported]) {
        self.session.delegate = self;
        [self.session activateSession];
        [self.session activationState];
    }
    
    return self;
}

- (WCSession *)session {
    @synchronized([WatchConnectivityManager class]) {
        if (!__session)
            __session = WCSession.defaultSession;
        return __session;
    }
    return __session;
}

- (void)active {
    [self.session activationState];
    [self.session activateSession];
}

- (void)send:(id)message replyHandle: (ReplyHandle) replyHandle errorHandler:(nullable void (^)(NSError *error))errorHandler {
    if (self.session.activationState != WCSessionActivationStateActivated) {
        return;
    }
#if TARGET_OS_IOS
    if (!self.session.isWatchAppInstalled) {
        return;
    }
#elif TARGET_OS_WATCH
    if (!self.session.isCompanionAppInstalled) {
        return;
    }
#else
    return;
#endif
    if (![self.session isReachable]) {
        return;
    }
    NSString *messageKey = WatchConnectivityManager.messageKey;
    [self.session sendMessage:@{messageKey : message} replyHandler: ^(NSDictionary<NSString *, id> *replyMessage) {
        _Nonnull id message = replyMessage[messageKey];
        replyHandle(message);
    } errorHandler: errorHandler];
}

@end
