//
//  AppDelegate.h
//  测试工程
//
//  Created by 石山岭 on 2018/12/3.
//  Copyright © 2018 石山岭. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

