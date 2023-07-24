//
//  CCDFloatingWindow.h
//  Pods
//
//  Created by 十年之前 on 2023/7/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol CCDFloatingWindowDelegate <NSObject>

- (BOOL)shouldHandleTouchAtView:(UIView *)view;

@end

@interface CCDFloatingWindow : UIWindow

@property (nonatomic, weak) id<CCDFloatingWindowDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
