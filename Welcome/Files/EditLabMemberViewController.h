//
//  EditLabMemberViewController.h
//  Welcome
//
//  Created by Shelby Vanhooser on 1/6/15.
//  Copyright (c) 2015 Integrated Applications. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataManager.h"
#import "LabMember.h"
#import "AdminViewController.h"

@interface EditLabMemberViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>

- (IBAction)back:(id)sender;
@property (strong, nonatomic) AdminViewController *delegate;
@property (strong, nonatomic) IBOutlet UIButton *addButton;
@property (strong, nonatomic) IBOutlet UIButton *updateButton;
@property (strong, nonatomic) IBOutlet UIButton *deleteButton;
@property (strong, nonatomic) IBOutlet UITextField *firstNameField;
@property (strong, nonatomic) IBOutlet UITextField *lastNameField;
@property (strong, nonatomic) IBOutlet UITextField *cellField;
@property (strong, nonatomic) IBOutlet UIPickerView *labPicker;
- (IBAction)add:(id)sender;
- (IBAction)update:(id)sender;
- (IBAction)deleteMember:(id)sender;

@end
