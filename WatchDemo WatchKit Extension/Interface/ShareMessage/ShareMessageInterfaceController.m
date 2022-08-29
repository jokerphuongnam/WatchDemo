//
//  ShareMessageInterfaceController.m
//  WatchDemo WatchKit Extension
//
//  Created by pnam on 29/08/2022.
//

#import "ShareMessageInterfaceController.h"
#import "ShareMessageInterfaceController+WatchConnectivity.h"

@interface ShareMessageInterfaceController()
@property (weak, nonatomic) IBOutlet WKInterfaceTextField *inputIextField;
@end
@implementation ShareMessageInterfaceController
WatchConnectivityManager *watchConnectivity;

NSMutableString *inputText;

- (instancetype)init {
    self = [super init];
    watchConnectivity = WatchConnectivityManager.shared;
    [watchConnectivity setDelegate:self];
    inputText = [[NSMutableString alloc] init];
    return self;
}

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
}

- (void)willActivate {
    [super willActivate];
    [watchConnectivity active];
}

- (void)didDeactivate {
    [super didDeactivate];
    [watchConnectivity removeDelegate:self];
}

- (IBAction)setInputtext:(NSString *)value {
    inputText = [[NSMutableString alloc] initWithString:value];
}

- (IBAction)sendButtonAction {
    [watchConnectivity send: inputText replyHandle:^(id _Nonnull message) {
        
    } errorHandler:^(NSError * _Nonnull error) {
        self.messageLabel.text = error.description;
    }];
}

- (WatchConnectivityManager *)watchConnectivity {
    return watchConnectivity;
}
@end
