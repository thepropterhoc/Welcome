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

@end

@implementation LabMemberViewController

-(void)viewDidLoad
{
  [self.memberPicker setDelegate:self];
  [self.memberPicker setDataSource:self];
  self.members = [[Controller sharedInstance] allLabMembers];
}

- (IBAction)checkIn:(id)sender
{
  [[Controller sharedInstance] checkNewVisitorIn];
  Visitor *v;
  if(!self.returning){
    v = [[Controller sharedInstance] saveNewVisitor];
  } else {
    v = [[Controller sharedInstance] updateReturningVisitor];
  }

  MFMessageComposeViewController *message = [[MFMessageComposeViewController alloc] init];
  [message setMessageComposeDelegate:self];
  message.title = [NSString stringWithFormat:@"Notify %@ of your arrival", ((LabMember*) self.members[self.selectedIndex]).firstName];
  message.recipients = @[((LabMember*) self.members[self.selectedIndex]).contactNumber];
  message.subject = [NSString stringWithFormat:@"%@ %@ has arrived", v.firstName, v.lastName];
  message.body = [NSString stringWithFormat:@"%@, \n\n%@ %@ from %@ has arrived to see you.  \n\nCheers,\n\nThe Welcome App", ((LabMember*) self.members[self.selectedIndex]).firstName, v.firstName, v.lastName, v.companyName];
    if(message){
    [self presentViewController:message animated:YES completion:^{
      [[[UIAlertView alloc] initWithTitle:@"Notify" message:[NSString stringWithFormat:@"Tap send to notify %@ of your arrival", ((LabMember *) self.members[self.selectedIndex]).firstName] delegate:nil cancelButtonTitle:@"Got it" otherButtonTitles:nil] show];
    }];
    } else {
      [self dismissViewControllerAnimated:YES completion:^{
        [self.navigationController popToRootViewControllerAnimated:YES];
        [[[UIAlertView alloc] initWithTitle:@"Test Success" message:@"You're debugging" delegate:nil cancelButtonTitle:@"Awesome" otherButtonTitles:nil] show];
      }];
    }
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
  self.selectedIndex = (int) row;
}

-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
  LabMember *member = self.members[row];
  return [NSString stringWithFormat:@"%@ %@", member.firstName, member.lastName];
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
    [self.navigationController popToRootViewControllerAnimated:YES];
    [[[UIAlertView alloc] initWithTitle:@"Success" message:[NSString stringWithFormat:@"Welcome to the lab.  %@ will be with you shortly", ((LabMember*) self.members[self.selectedIndex]).firstName] delegate:nil cancelButtonTitle:@"Awesome" otherButtonTitles:nil] show];
  }];
}

@end
