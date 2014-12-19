//
//  CompanyViewController.m
//  Welcome
//
//  Created by Shelby Vanhooser on 12/18/14.
//  Copyright (c) 2014 Integrated Applications. All rights reserved.
//

#import "CompanyViewController.h"
#import "Controller.h"

@interface CompanyViewController ()

@property (strong, nonatomic) IBOutlet UITextField *companyNameField;

@end

@implementation CompanyViewController

- (IBAction)next:(id)sender
{
  [[Controller sharedInstance] setNewVisitorCompanyName:self.companyNameField.text];
  [self performSegueWithIdentifier:@"goToCompanyCity" sender:self];
}

- (IBAction)skip:(id)sender
{
  [[Controller sharedInstance] setNewVisitorCompanyCity:@"N/A"];
  [[Controller sharedInstance] setNewVisitorCompanyName:@"N/A"];
  [self performSegueWithIdentifier:@"goToLabMember" sender:self];
}

@end
