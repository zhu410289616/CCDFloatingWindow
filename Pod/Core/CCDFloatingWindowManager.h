//
//  CCDFloatingWindowManager.h
//  FloatingWindow
//
//  Created by 十年之前 on 2023/7/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CCDFloatingWindowManager : NSObject

+ (instancetype)sharedInstance;

- (void)showFloatingWindow;
- (void)hideFloatingWindow;

- (void)addSubview:(UIView *)view;

@end

NS_ASSUME_NONNULL_END
