//
//  ShareMessageViewController.m
//  WatchDemo
//
//  Created by pnam on 28/08/2022.
//

#import "ShareMessageViewController.h"
#import "ShareMessageViewController+WatchConnectivity.h"

@interface ShareMessageViewController ()
@property (weak, nonatomic) IBOutlet UITextField *messageTextField;
@end

@implementation ShareMessageViewController
WatchConnectivityManager *watchConnectivity;

- (instancetype)init {
    self = [super init];
    watchConnectivity = WatchConnectivityManager.shared;
    [watchConnectivity setDelegate:self];
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
}

- (IBAction)sendAction:(UIButton *)sender forEvent:(UIEvent *)event {
    [watchConnectivity send:self.messageTextField.text replyHandle:^(id _Nonnull message) {
        
    } errorHandler:^(NSError * _Nonnull error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            self.errorLabel.text = error.description;
        });
    }];
}
@end
