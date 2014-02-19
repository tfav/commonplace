//
//  tfMasterViewController.h
//  Commonplace
//
//  Created by Travis Favaron on 12/24/13.
//  Copyright (c) 2013 Travis Favaron. All rights reserved.
//

#import <UIKit/UIKit.h>

@class tfDetailViewController;

#import <CoreData/CoreData.h>

@interface tfMasterViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) tfDetailViewController *detailViewController;

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;


@property(nonatomic, retain) UIColor *barTintColor;
@end
