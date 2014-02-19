//
//  tfDetailViewController.h
//  Commonplace
//
//  Created by Travis Favaron on 12/24/13.
//  Copyright (c) 2013 Travis Favaron. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface tfDetailViewController : UIViewController <UISplitViewControllerDelegate> {
    IBOutlet UITextView *bodyContent;
    UITextField *navbarTitle;
}

@property (strong, nonatomic) id detailItem;

@property (strong, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end