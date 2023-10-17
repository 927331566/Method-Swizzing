//
//  NSObject+ExchangeMethod.m
//  Test
//
//  Created by 王璐 on 2023/10/16.
//

#import "NSObject+ExchangeMethod.h"
#import <objc/runtime.h>

@implementation NSObject (ExchangeMethod)
+ (BOOL)exchangedSystemSelector:(SEL)systemSelector withSelector:(SEL)changedSelector error:(NSError *)error{

    Method systemMethod = class_getInstanceMethod(self, systemSelector);
    if (!systemMethod) {
        return NO;
    }

    Method changedMethod = class_getInstanceMethod(self, changedSelector);
    if (!changedMethod) {
        return NO;
    }

    if (class_addMethod([self class], systemSelector, method_getImplementation(changedMethod), method_getTypeEncoding(changedMethod))) {
        class_replaceMethod([self class], changedSelector, method_getImplementation(systemMethod), method_getTypeEncoding(systemMethod));
    }else{
        method_exchangeImplementations(systemMethod, changedMethod);
    }

    return YES;
}
@end
