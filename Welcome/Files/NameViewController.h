//
//  NameViewController.h
//  Welcome
//
//  Created by Shelby Vanhooser on 12/18/14.
//  Copyright (c) 2014 Integrated Applications. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Controller.h"

@interface NameViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *firstNameField;
@property (strong, nonatomic) IBOutlet UITextField *lastNameField;
- (IBAction)next:(id)sender;

@end
