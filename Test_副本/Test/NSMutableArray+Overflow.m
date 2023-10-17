//
//  NSMutableArray+Overflow.m
//  Test
//
//  Created by 王璐 on 2023/10/16.
//

#import "NSMutableArray+Overflow.h"
#import "NSObject+ExchangeMethod.h"

@implementation NSMutableArray (Overflow)
+(void)load{
    [super load];
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [objc_getClass("__NSArrayM") exchangedSystemSelector:@selector(objectAtIndex:) withSelector:@selector(hd_objectAtIndex:) error:nil];
        [objc_getClass("__NSArrayM") exchangedSystemSelector:@selector(objectAtIndexedSubscript:) withSelector:@selector(hd_objectAtIndexedSubscript:) error:nil];
    });
}
- (id)hd_objectAtIndexedSubscript:(NSUInteger)idx{
    if (idx < self.count) {
        return [self hd_objectAtIndexedSubscript:idx];
    }else{
        NSLog(@"Error:数组越界了，index = %ld, count = %ld", idx, self.count);
        return nil;
    }
}

- (id)hd_objectAtIndex:(NSUInteger)index{
    if (index < self.count) {
        return [self hd_objectAtIndex:index];
    }else{
        NSLog(@"Error:数组越界了，index = %ld, count = %ld", index, self.count);
        return nil;
    }
}
@end
