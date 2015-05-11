//
//  EditLabMemberViewController.m
//  Welcome
//
//  Created by Shelby Vanhooser on 1/6/15.
//  Copyright (c) 2015 Integrated Applications. All rights reserved.
//

#import "EditLabMemberViewController.h"


@interface EditLabMemberViewController ()

@property (strong, nonatomic) NSArray *labMembers;
@property int selectedIndex;

@end

@implementation EditLabMemberViewController

#pragma mark - Initialization methods

-(void) viewDidLoad
{
  [super viewDidLoad];
  self.labMembers = [[DataManager sharedInstance] readAllLabMembers];
}

-(void) viewDidAppear:(BOOL)animated
{
  if (self.labMembers.count <= 0){
    self.labMembers = @[];
    self.selectedIndex = -1;
    [self setMembersPresent:NO];
  } else if(self.labMembers.count > 0){
    [self setMembersPresent:YES];
    [self populateFieldsForLabMember:self.labMembers[0]];
  }
}

- (IBAction)back:(id)sender
{
  [self.delegate dismissViewControllerAnimated:YES completion:^{
    
  }];
}

#pragma mark - Picker View methods

-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
  return [((LabMember *) self.labMembers[row]) stringRepresentation];
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
  self.selectedIndex = row;
  if(self.labMembers.count != 0){
    [self populateFieldsForLabMember:self.labMembers[row]];
  }
}

-(int)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
  if (self.labMembers.count > 0){
    [self setMembersPresent:YES];
  } else {
    [self setMembersPresent:NO];
  }
  return self.labMembers.count;
}

-(int)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
  return 1;
}

#pragma mark - Populating methods

-(void) populateFieldsForLabMember: (LabMember*) member
{
  if (!member){
    self.firstNameField.text = @"";
    self.lastNameField.text = @"";
    self.cellField.text = @"";
  } else {
    self.firstNameField.text = member.firstName;
    self.lastNameField.text = member.lastName;
    self.cellField.text = member.contactNumber;
  }
}

-(void) setMembersPresent: (BOOL) present
{
  
  if (!present){
    [self.updateButton setEnabled:NO];
    [self.deleteButton setEnabled:NO];
  } else {
    [self.updateButton setEnabled:YES];
    [self.deleteButton setEnabled:YES];
  }
}

#pragma mark - Committing methods

- (IBAction)add:(id)sender
{
  if(![self.firstNameField.text isEqualToString:@""] && ![self.lastNameField.text isEqualToString:@""] && ![self.cellField.text isEqualToString:@""]){
    [[DataManager sharedInstance] createNewLabMember:[LabMember labMemberWithFirstName:self.firstNameField.text lastName:self.lastNameField.text contactNumber:self.cellField.text]];
    self.labMembers = [[DataManager sharedInstance] readAllLabMembers];
    [self.labPicker reloadAllComponents];
  }
}

- (IBAction)update:(id)sender
{
  if(self.selectedIndex != -1){
    LabMember *l = self.labMembers[self.selectedIndex];
    l.firstName = self.firstNameField.text;
    l.lastName = self.lastNameField.text;
    l.contactNumber = self.cellField.text;
    [[DataManager sharedInstance] updateLabMember:l];
  }
  self.labMembers = [[DataManager sharedInstance] readAllLabMembers];
  [self.labPicker reloadAllComponents];
}

- (IBAction)deleteMember:(id)sender
{
  if(self.selectedIndex != -1){
    [[DataManager sharedInstance] deleteLabMember:self.labMembers[self.selectedIndex]];
  }
  self.labMembers = [[DataManager sharedInstance] readAllLabMembers];
  [self.labPicker reloadAllComponents];
  [self populateFieldsForLabMember:nil];
}

@end
