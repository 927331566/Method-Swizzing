//
//  ViewController.m
//  Test
//
//  Created by 王璐 on 2023/10/12.
//

#import "ViewController.h"
//#import "objc/runtime.h"
#import "NSArray+Safe.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // 测试数组
    NSArray *arr = @[@"1",@"2",@"2",@"2",@"2",@"2",@"2",@"2",@"2"];
    //NSMutableArray *tableArray = [[NSMutableArray alloc] initWithArray:arr];
    NSLog(@"arr====%@   ",arr[100]);
    NSLog(@"arr====%@   ",[arr objectAtIndex:100]);
    
}

@end
