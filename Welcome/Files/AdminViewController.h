//
//  AdminViewController.h
//  Welcome
//
//  Created by Shelby Vanhooser on 12/18/14.
//  Copyright (c) 2014 Integrated Applications. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CSV/CSV.h>
#import <CSV/CSVSerializer.h>
#import "Controller.h"
#import <MessageUI/MessageUI.h>

@interface AdminViewController : UIViewController <MFMailComposeViewControllerDelegate>

@property (strong, nonatomic) UIViewController *delegate;
- (IBAction)back:(id)sender;

@end
