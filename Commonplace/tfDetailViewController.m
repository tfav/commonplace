//
//  tfDetailViewController.m
//  Commonplace
//
//  Created by Travis Favaron on 12/24/13.
//  Copyright (c) 2013 Travis Favaron. All rights reserved.
//

#import "tfDetailViewController.h"
#import "aNote.h"

@interface tfDetailViewController ()
@property (strong, nonatomic) UIPopoverController *masterPopoverController;
- (void)configureView;
@property (strong, nonatomic) UITextField *textField;
@end

@implementation tfDetailViewController


#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }

    if (self.masterPopoverController != nil) {
        [self.masterPopoverController dismissPopoverAnimated:YES];
    }        
}

- (void)configureView
{
    // Update the user interface for the detail item.

    if (self.detailItem) {
        //self.detailDescriptionLabel.text = [[self.detailItem valueForKey:@"timeStamp"] description];
        aNote *note = (aNote *)self.detailItem;
        bodyContent.text = note.noteContent;
        navbarTitle = [[UITextField alloc]initWithFrame:CGRectMake(0,0,200,22)];
        navbarTitle.text = note.noteTitle;
        navbarTitle.font = [UIFont boldSystemFontOfSize:19];
        navbarTitle.textColor = [UIColor colorWithRed:177/255.0f green:137/255.0f blue:26/255.0f alpha:1];
        navbarTitle.textAlignment = NSTextAlignmentCenter;
        self.navigationItem.titleView = navbarTitle;
        note.noteTitle = navbarTitle.text;
        
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //Attempting to add the small icon next to the back button in detail view.
    //[[UINavigationBar appearance] setShadowImage:[[UIImage alloc ] init]];
    //[[UINavigationBar appearance]setShadowImage:[UIImage imageNamed:@"shadowImg@2x.png"]];
    //aNote *note = (aNote *)self.detailItem;
    

    
    // self.title = @"Random Title";
    
    
    [self configureView];
}
- (void)viewDidDisappear:(BOOL)animated
{

    aNote *note = (aNote *)self.detailItem;
    note.noteTitle = navbarTitle.text;
    note.noteContent = bodyContent.text;
    
    NSError *error;
    [[note managedObjectContext] save:&error];
    
    [super viewDidDisappear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Split view

- (void)splitViewController:(UISplitViewController *)splitController willHideViewController:(UIViewController *)viewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)popoverController
{
    barButtonItem.title = NSLocalizedString(@"Master", @"Master");
    [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
    self.masterPopoverController = popoverController;
}

- (void)splitViewController:(UISplitViewController *)splitController willShowViewController:(UIViewController *)viewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    // Called when the view is shown again in the split view, invalidating the button and popover controller.
    [self.navigationItem setLeftBarButtonItem:nil animated:YES];
    self.masterPopoverController = nil;
}

@end
