//
//  NSArray+FX.m
//  Test
//
//  Created by 王璐 on 2023/10/16.
//

#import "NSArray+FX.h"
#import <objc/runtime.h>

@implementation NSArray (FX)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        
        NSLog(@"111111----");
        // 交换objectAtIndex方法
        Method oriMethod1 = class_getInstanceMethod(objc_getClass("__NSArrayI"), @selector(objectAtIndex:));
        Method swiMethod1 = class_getInstanceMethod(objc_getClass("__NSArrayI"), @selector(fx_objectAtIndex:));
        method_exchangeImplementations(oriMethod1, swiMethod1);
        
       //  交换取下标方法
        Method oriMethod2 = class_getInstanceMethod(objc_getClass("__NSArrayI"), @selector(objectAtIndexedSubscript:));
        Method swiMethod2 = class_getInstanceMethod(objc_getClass("__NSArrayI"), @selector(fx_objectAtIndexedSubscript:));
        method_exchangeImplementations(oriMethod2, swiMethod2);
    });
}


- (void)fx_objectAtIndex:(NSInteger)index {
    if (index > self.count - 1) {
        NSLog(@"objectAtIndex————————数组越界");
        return;
    }
    return [self fx_objectAtIndex:index];
}

- (void)fx_objectAtIndexedSubscript:(NSInteger)index {
    if (index > self.count - 1) {
        NSLog(@"取下标————————数组越界");
        return;
    }
    return [self fx_objectAtIndexedSubscript:index];
}

@end
