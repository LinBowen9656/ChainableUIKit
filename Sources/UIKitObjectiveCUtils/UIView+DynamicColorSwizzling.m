//
//  UIView+DynamicColorSwizzling.m
//  
//
//  Created by 柴阿文 on 2021/1/26.
//

#import "UIView+DynamicColorSwizzling.h"
@import UIKitUtils;
@import ObjectiveC;

@implementation UIView(DynamicColor)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        SEL originSelector = @selector(traitCollectionDidChange:);
        SEL swizzlingSelector = @selector(traitCollectionDidChangeSwizzlingForDynamicColor:);
        Method originMethod = class_getInstanceMethod(self, originSelector);
        Method swizzlingMethod = class_getInstanceMethod(self, swizzlingSelector);
        BOOL isAddedMethod = class_addMethod(self, originSelector, method_getImplementation(swizzlingMethod), method_getTypeEncoding(swizzlingMethod));
        if (isAddedMethod) {
            class_replaceMethod(self, swizzlingSelector, method_getImplementation(originMethod), method_getTypeEncoding(originMethod));
        } else {
            method_exchangeImplementations(originMethod, swizzlingMethod);
        }
    });
}

- (void)traitCollectionDidChangeSwizzlingForDynamicColor:(UITraitCollection *)previousTraitCollection {
    [self traitCollectionDidChangeSwizzlingForDynamicColor:previousTraitCollection];
    if (@available(iOS 13.0, *)) {
        if ([self.traitCollection hasDifferentColorAppearanceComparedToTraitCollection:previousTraitCollection]) {
            if (self.borderColor != nil) {
                self.layer.borderColor = [self.borderColor resolvedColorWithTraitCollection:self.traitCollection].CGColor;
            }
            if (self.borderShadowColor != nil) {
                self.layer.shadowColor = [self.borderShadowColor resolvedColorWithTraitCollection:self.traitCollection].CGColor;
            }
        }
    }
}

@end
