//
//  ShareMessageViewController.h
//  WatchDemo
//
//  Created by pnam on 28/08/2022.
//

#import <UIKit/UIKit.h>
#import "WatchConnectivityManagerDelegate.h"
#import "WatchConnectivityManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface ShareMessageViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *errorLabel;
@property (nonatomic, assign, readonly) WatchConnectivityManager *watchConnectivity;
@end

NS_ASSUME_NONNULL_END
