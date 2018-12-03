//
//  ViewController.m
//  测试工程
//
//  Created by 石山岭 on 2018/12/3.
//  Copyright © 2018 石山岭. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSArray *tempArray = @[@{@"orderId":@"1"}, @{@"orderId":@"1"}, @{@"orderId":@"1"}, @{@"orderId":@"1"}, @{@"orderId":@"2"}, @{@"orderId":@"2"}, @{@"orderId":@"2"}, @{@"orderId":@"2"}, @{@"orderId":@"2"}, @{@"orderId":@"3"}, @{@"orderId":@"3"}, @{@"orderId":@"4"}, @{@"orderId":@"5"}];
    /石山岭
    NSMutableArray *orderListArray = [NSMutableArray array];//总订单的数组
    NSString *tempOrderId = @"";//记录上一个订单ID
    NSMutableArray *supplierArray = [NSMutableArray array];
    for (int i= 0; i< tempArray.count; i++) {//循环后台返回的数据
        NSDictionary *tempDic = tempArray[i];//得到数组里面的单个订单
        NSString *orderId = tempDic[@"orderId"];//取出订单id
//        NSLog(@"orderId---%@ orderListArray%@ supplierArray%@", orderId, orderListArray, supplierArray);
        if (![orderId isEqualToString:tempOrderId]) {//如果 外部 的tempOrderId 和 当前的 orderId 不一样 说明是新的供应商
            if (supplierArray.count != 0) {//这个是避免存储空的数组
                [orderListArray addObject:supplierArray];//吧上面的供应商存入数组
            }
            supplierArray = [NSMutableArray arrayWithArray:@[]];//把数组置空
            NSLog(@"orderListArray%@", orderListArray);
            [supplierArray addObject:tempDic];//存储新的供应商ID
            //清除
            tempOrderId = orderId;//存储新的订单ID
        }else {//如果和上个 orderId 一样 说明是同一个供应商
            [supplierArray addObject:tempDic];//存储新的供应商ID
        }
        if (i == tempArray.count - 1) {
            [orderListArray addObject:supplierArray];//吧最后一个供应商存入数组
        }
    }
    NSLog(@"orderListArray%@", orderListArray);
    
    
}


@end
