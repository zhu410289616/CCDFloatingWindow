//
//  CCDFloatingWindowManager.m
//  FloatingWindow
//
//  Created by 十年之前 on 2023/7/24.
//

#import "CCDFloatingWindowManager.h"
#import "CCDFloatingWindow.h"

@interface CCDFloatingWindowManager () <CCDFloatingWindowDelegate>

@property (nonatomic, strong) CCDFloatingWindow *floatingWindow;
@property (nonatomic, strong) UIViewController *floatingController;

@end

@implementation CCDFloatingWindowManager

+ (instancetype)sharedInstance
{
    static id sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

#pragma mark - getter & setter

- (UIViewController *)floatingController
{
    if (!_floatingController) {
        _floatingController = [[UIViewController alloc] init];
        _floatingController.view.backgroundColor = [UIColor clearColor];
    }
    return _floatingController;
}

- (CCDFloatingWindow *)floatingWindow
{
    if (!_floatingWindow) {
        CGRect frame = [UIScreen mainScreen].bounds;
        _floatingWindow = [[CCDFloatingWindow alloc] initWithFrame:frame];
        _floatingWindow.rootViewController = self.floatingController;
        _floatingWindow.delegate = self;
        _floatingWindow.windowLevel = pow(10, 6);
    }
    return _floatingWindow;
}

#pragma mark - CCDFloatingWindowDelegate

- (BOOL)shouldHandleTouchAtView:(UIView *)view
{
    if (view == self.floatingController.view) {
        return NO;
    }
    return YES;
}

#pragma mark - public function

- (void)showFloatingWindow
{
    self.floatingWindow.hidden = NO;
}

- (void)hideFloatingWindow
{
    self.floatingWindow.hidden = YES;
}

#pragma mark - add view

- (void)addSubview:(UIView *)view
{
    if (!view || !self.floatingWindow ||
        [self.floatingWindow.subviews containsObject:view]) {
        return;
    }
    [self.floatingWindow addSubview:view];
}

@end
