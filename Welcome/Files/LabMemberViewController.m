//
//  LabMemberViewController.m
//  Welcome
//
//  Created by Shelby Vanhooser on 12/19/14.
//  Copyright (c) 2014 Integrated Applications. All rights reserved.
//

#import "LabMemberViewController.h"

@interface LabMemberViewController ()

@property (strong, nonatomic) IBOutlet UIPickerView *memberPicker;
@property (strong, nonatomic) NSArray *members;

@end

@implementation LabMemberViewController

-(void)viewDidLoad
{
  [self.memberPicker setDelegate:self];
  [self.memberPicker setDataSource:self];
  self.members = @[@"Dirk Spiers", @"Bryan Schultz", @"Shelby Vanhooser"];
}

- (IBAction)checkIn:(id)sender
{
  
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
  
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

@end
