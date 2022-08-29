//
//  WatchConnectivityManagerDelegate.h
//  WatchDemo
//
//  Created by pnam on 28/08/2022.
//

#import "WatchConnectivityManager.h"

NS_ASSUME_NONNULL_BEGIN
@protocol WatchConnectivityManagerDelegate <NSObject>
@required

/** Called when the session has completed activation. If session state is WCSessionActivationStateNotActivated there will be an error with more details. */
- (void)watchConnectivity:(nonnull WatchConnectivityManager *) manager session:(nonnull WCSession *)session activationDidCompleteWithState:(WCSessionActivationState)activationState error:(nullable NSError *)error;

/** ------------------------- iOS App State For Watch ------------------------ */

/** Called when the session can no longer be used to modify or add any new transfers and, all interactive messages will be cancelled, but delegate callbacks for background transfers can still occur. This will happen when the selected watch is being changed. */
-(void)watchConnectivity:(nonnull WatchConnectivityManager *) manager didBecomeInactive:(nonnull WCSession *)session __WATCHOS_UNAVAILABLE;

/** Called when all delegate callbacks for the previously selected watch has occurred. The session can be re-activated for the now selected watch using activateSession. */
-(void)watchConnectivity:(nonnull WatchConnectivityManager *) manager didDeactivate:(nonnull WCSession *)session __WATCHOS_UNAVAILABLE;
@optional
/** Called when any of the Watch state properties change. */
- (void)watchConnectivity:(nonnull WatchConnectivityManager *) manager watchStateDidChange:(nonnull WCSession *)session __WATCHOS_UNAVAILABLE;

/** Called when the installed state of the Companion app changes. */
- (void)watchConnectivity:(nonnull WatchConnectivityManager *) manager companionAppInstalledDidChange:(nonnull WCSession *)session __IOS_UNAVAILABLE __WATCHOS_AVAILABLE(6.0);

/** ------------------------- Interactive Messaging ------------------------- */

/** Called when the reachable state of the counterpart app changes. The receiver should check the reachable property on receiving this delegate callback. */
- (void)watchConnectivity:(nonnull WatchConnectivityManager *) manager reachabilityDidChange:(nonnull WCSession *)session;

/** Called on the delegate of the receiver. Will be called on startup if the incoming message caused the receiver to launch. */
- (void)watchConnectivity:(nonnull WatchConnectivityManager *) manager session:(nonnull WCSession *)session didReceiveMessage:(nonnull NSDictionary<NSString *, id> *)message;

/** Called on the delegate of the receiver when the sender sends a message that expects a reply. Will be called on startup if the incoming message caused the receiver to launch. */
- (void)watchConnectivity:(nonnull WatchConnectivityManager *) manager session:(nonnull WCSession *)session didReceiveMessage:(nonnull NSDictionary<NSString *, id> *)message replyHandler:(void(^_Nonnull)(NSDictionary<NSString *, id> * _Nonnull replyMessage))replyHandler;

/** Called on the delegate of the receiver. Will be called on startup if the incoming message data caused the receiver to launch. */
- (void)watchConnectivity:(nonnull WatchConnectivityManager *) manager session:(nonnull WCSession *)session didReceiveMessageData:(NSData *_Nullable)messageData;

/** Called on the delegate of the receiver when the sender sends message data that expects a reply. Will be called on startup if the incoming message data caused the receiver to launch. */
- (void)watchConnectivity:(nonnull WatchConnectivityManager *) manager session:(nonnull WCSession *)session didReceiveMessageData:(nonnull NSData *)messageData replyHandler:(void(^_Nonnull)(NSData * _Nonnull replyMessageData))replyHandler;


/** -------------------------- Background Transfers ------------------------- */

/** Called on the delegate of the receiver. Will be called on startup if an applicationContext is available. */
- (void)watchConnectivity:(nonnull WatchConnectivityManager *) manager session:(nonnull WCSession *)session didReceiveApplicationContext:(NSDictionary<NSString *, id> *_Nullable)applicationContext;

/** Called on the sending side after the user info transfer has successfully completed or failed with an error. Will be called on next launch if the sender was not running when the user info finished. */
- (void)watchConnectivity:(nonnull WatchConnectivityManager *) manager session:(nonnull WCSession *)session didFinishUserInfoTransfer:(WCSessionUserInfoTransfer *_Nonnull)userInfoTransfer error:(nullable NSError *)error;

/** Called on the delegate of the receiver. Will be called on startup if the user info finished transferring when the receiver was not running. */
- (void)watchConnectivity:(nonnull WatchConnectivityManager *) manager session:(nonnull WCSession *)session didReceiveUserInfo:(NSDictionary<NSString *, id> *_Nonnull)userInfo;

/** Called on the sending side after the file transfer has successfully completed or failed with an error. Will be called on next launch if the sender was not running when the transfer finished. */
- (void)watchConnectivity:(nonnull WatchConnectivityManager *) manager session:(nonnull WCSession *)session didFinishFileTransfer:(WCSessionFileTransfer *_Nullable)fileTransfer error:(nullable NSError *)error;

/** Called on the delegate of the receiver. Will be called on startup if the file finished transferring when the receiver was not running. The incoming file will be located in the Documents/Inbox/ folder when being delivered. The receiver must take ownership of the file by moving it to another location. The system will remove any content that has not been moved when this delegate method returns. */
- (void)watchConnectivity:(nonnull WatchConnectivityManager *) manager session:(nonnull WCSession *)session didReceiveFile:(nonnull  WCSessionFile *)file;
@end

NS_ASSUME_NONNULL_END
