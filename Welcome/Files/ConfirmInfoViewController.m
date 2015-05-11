//
//  ConfirmInfoViewController.m
//  Welcome
//
//  Created by Shelby Vanhooser on 12/22/14.
//  Copyright (c) 2014 Integrated Applications. All rights reserved.
//

#import "ConfirmInfoViewController.h"

@interface ConfirmInfoViewController ()

@property (strong, nonatomic) IBOutlet UITextField *firstNameField;
@property (strong, nonatomic) IBOutlet UITextField *lastNameField;
@property (strong, nonatomic) IBOutlet UITextField *companyNameField;
@property (strong, nonatomic) IBOutlet UITextField *companyCityField;

@end

@implementation ConfirmInfoViewController

-(void) viewDidLoad
{
  [super viewDidLoad];
  [self populateFieldsForVisitor:[[Controller sharedInstance] currentVisitor]];
}

-(void) populateFieldsForVisitor:(Visitor*) v
{
  self.firstNameField.text = v.firstName;
  self.lastNameField.text = v.lastName;
  self.companyNameField.text = v.companyName;
  self.companyCityField.text = v.companyCity;
}

- (IBAction)confirm:(id)sender
{
  [[Controller sharedInstance] setNewVisitorFirstName:self.firstNameField.text];
  [[Controller sharedInstance] setNewVisitorLastName:self.lastNameField.text];
  [[Controller sharedInstance] setNewVisitorCompanyName:self.companyNameField.text];
  [[Controller sharedInstance] setNewVisitorCompanyCity:self.companyCityField.text];
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
  if([[segue identifier] isEqualToString:@"goToLabMember"]){
    ((LabMemberViewController*) [segue destinationViewController]).returning = YES;
  }
}

@end
