//
//  CCDFloatWindow.m
//  Pods
//
//  Created by 十年之前 on 2023/7/22.
//

#import "CCDFloatingWindow.h"

@implementation CCDFloatingWindow

#pragma mark -

- (nullable UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    // 1.判断自己能否接收触摸事件
    if (self.userInteractionEnabled == NO || self.hidden == YES || self.alpha <= 0.01) return nil;
    // 2.判断触摸点在不在自己范围内
    if (![self pointInside:point withEvent:event])
        return nil;
    // 3.从后往前遍历自己的子控件，看是否有子控件更适合响应此事件
    NSUInteger count = self.subviews.count;
    for (NSInteger i = count - 1; i >= 0; i--) {
        UIView *childView = self.subviews[i];
        CGPoint childPoint = [self convertPoint:point toView:childView];
        UIView *fitView = [childView hitTest:childPoint withEvent:event];
        if (fitView && [self.delegate shouldHandleTouchAtView:fitView]) {
            return fitView;
        }
    }
    // 没有找到能响应事件的view则把事件抛出去
    return nil;
}

- (void)makeKeyWindow
{
    [[[UIApplication sharedApplication].delegate window] makeKeyWindow];
}

@end
