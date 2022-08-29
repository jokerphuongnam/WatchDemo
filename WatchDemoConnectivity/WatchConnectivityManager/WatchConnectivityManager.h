//
//  WatchConnectivityManager.h
//  WatchDemo
//
//  Created by pnam on 28/08/2022.
//

#import <Foundation/Foundation.h>
#import "WatchConnectivity/WatchConnectivity.h"

NS_ASSUME_NONNULL_BEGIN

typedef void (^ReplyHandle) (id _Nonnull message);
@protocol WatchConnectivityManagerDelegate;

@interface WatchConnectivityManager : NSObject
@property (class, nonatomic, assign, readonly) WatchConnectivityManager* shared;
@property (class, nonatomic, assign, readonly) NSString *messageKey;
@property (nullable, strong, nonatomic) id<WatchConnectivityManagerDelegate> delegate;
-(void)removeDelegate: (nonnull id<WatchConnectivityManagerDelegate>) delegate;
-(void)active;
-(void)send:(id)message replyHandle: (ReplyHandle) replyHandle errorHandler:(nullable void (^)(NSError *error))errorHandler;
@end

NS_ASSUME_NONNULL_END
