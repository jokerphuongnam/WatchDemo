//
//  MainInterfaceController.m
//  WatchDemo
//
//  Created by pnam on 28/08/2022.
//

#import "MainInterfaceController.h"
#import "ShareMessageInterfaceController.h"
#import "MainRowController.h"
#import "MainOption.h"

@interface MainInterfaceController()
@property (weak, nonatomic) IBOutlet WKInterfaceTable *table;
@end

@implementation MainInterfaceController


- (instancetype)init {
    self = [super init];
    return self;
}

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    [self loadOptions];
}

- (void)willActivate {
    [super willActivate];
}

- (void)didDeactivate {
    [super didDeactivate];
}

- (void) loadOptions {
    [self.table setNumberOfRows:2 withRowType:NSStringFromClass([MainRowController class])];
    for (int i = 0; i < [self.table numberOfRows]; i++) {
        MainRowController *row = [self.table rowControllerAtIndex:i];
        if (row) {
            [row.rowLabel setText:mainOptions[i]];
        }
    }
}

- (void)table:(WKInterfaceTable *)table didSelectRowAtIndex:(NSInteger)rowIndex {
    switch (rowIndex) {
        case ShareMessage: {
            [self presentControllerWithName:NSStringFromClass([ShareMessageInterfaceController class]) context:nil];
            break;
        }
        default:
            break;
    }
}
@end
