//
//  CompanyCityViewController.m
//  Welcome
//
//  Created by Shelby Vanhooser on 12/19/14.
//  Copyright (c) 2014 Integrated Applications. All rights reserved.
//

#import "CompanyCityViewController.h"
#import "Controller.h"

@interface CompanyCityViewController ()

@property (strong, nonatomic) IBOutlet UITextField *companyCityField;

@end

@implementation CompanyCityViewController

- (IBAction)next:(id)sender
{
  [[Controller sharedInstance] setNewVisitorCompanyCity:self.companyCityField.text];
  [self performSegueWithIdentifier:@"goToLabMember" sender:self];
}

@end
