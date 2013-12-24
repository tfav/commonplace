//
//  tfAppDelegate.h
//  Commonplace
//
//  Created by Travis Favaron on 12/24/13.
//  Copyright (c) 2013 Travis Favaron. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface tfAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
