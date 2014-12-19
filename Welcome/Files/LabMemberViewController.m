//
//  LabMemberViewController.m
//  Welcome
//
//  Created by Shelby Vanhooser on 12/19/14.
//  Copyright (c) 2014 Integrated Applications. All rights reserved.
//

#import "LabMemberViewController.h"
#import "Controller.h"

@interface LabMemberViewController ()

@property (strong, nonatomic) IBOutlet UIPickerView *memberPicker;
@property (strong, nonatomic) NSArray *members;
@property (strong, nonatomic) NSArray *memberNumbers;
@property int selectedIndex;
@property (strong, nonatomic) MFMessageComposeViewController *controller;

@end

@implementation LabMemberViewController

-(void)viewDidLoad
{
  [self.memberPicker setDelegate:self];
  [self.memberPicker setDataSource:self];
  self.members = @[@"Dirk Spiers", @"Bryan Schultz", @"Shelby Vanhooser"];
  self.memberNumbers = @[@"14054642200", @"14052136218", @"15805487494"];
  self.controller = nil;
}

- (IBAction)checkIn:(id)sender
{
  [[Controller sharedInstance] checkNewVisitorIn];
  Visitor *v = [[Controller sharedInstance] saveNewVisitor];
  //[[Controller sharedInstance] notifyLabMemberOfCurrentVisitorArrivalWithContactNumber:];
  
  MFMessageComposeViewController *message = [[MFMessageComposeViewController alloc] init];
  [message setMessageComposeDelegate:self];
  message.title = [NSString stringWithFormat:@"Notify %@ of your arrival", self.members[self.selectedIndex]];
  message.recipients = @[self.memberNumbers[self.selectedIndex]];
  message.subject = [NSString stringWithFormat:@"%@ %@ has arrived", v.firstName, v.lastName];
  message.body = [NSString stringWithFormat:@"%@, \n\n%@ %@ from %@ has arrived to see you.  \n\nCheers,\n\nThe Welcome App", self.members[self.selectedIndex], v.firstName, v.lastName, v.companyName];
  
  [self presentViewController:message animated:YES completion:^{
    [[[UIAlertView alloc] initWithTitle:@"Notify" message:[NSString stringWithFormat:@"Tap send to notify %@ of your arrival", self.members[self.selectedIndex]] delegate:nil cancelButtonTitle:@"Got it" otherButtonTitles:nil] show];
  }];
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
  self.selectedIndex = (int) row;
}

-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
  return self.members[row];
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
  
  return [self.members count];
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
  return 1;
}

- (IBAction)cancel:(id)sender
{
  [[Controller sharedInstance] clearNewVisitor];
  [self.navigationController popToRootViewControllerAnimated:YES];
}

-(void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result
{
  [self dismissViewControllerAnimated:YES completion:^{
    self.controller = nil;
    [self.navigationController popToRootViewControllerAnimated:YES];
    [[[UIAlertView alloc] initWithTitle:@"Success" message:[NSString stringWithFormat:@"Welcome to the lab.  %@ will be with you shortly", self.members[self.selectedIndex]] delegate:nil cancelButtonTitle:@"Awesome" otherButtonTitles:nil] show];
  }];
}

@end
