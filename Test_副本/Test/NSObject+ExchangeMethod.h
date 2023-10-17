//
//  NSObject+ExchangeMethod.h
//  Test
//
//  Created by 王璐 on 2023/10/16.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (ExchangeMethod)
+ (BOOL)exchangedSystemSelector:(SEL)systemSelector withSelector:(SEL)changedSelector error:(NSError *)error;

@end

NS_ASSUME_NONNULL_END
