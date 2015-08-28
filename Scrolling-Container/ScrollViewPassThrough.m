
#import "ScrollViewPassThrough.h"

@implementation ScrollViewPassThrough

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    
    for (UIView *subview in self.subviews) {
        CGPoint relativePoint = [subview convertPoint:point fromView:self];
        
        if ([subview pointInside:relativePoint withEvent:event]) {
            return YES;
        }
    }
    return NO;
}

@end
