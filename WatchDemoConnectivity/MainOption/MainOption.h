//
//  MainOption.h
//  WatchDemo
//
//  Created by pnam on 29/08/2022.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, MainOption)  {
    ShareMessage,
    CompressFile
};

FOUNDATION_EXPORT NSString *const _Nonnull mainOptions[2];
FOUNDATION_EXPORT const int mainCount;

NS_ASSUME_NONNULL_END
