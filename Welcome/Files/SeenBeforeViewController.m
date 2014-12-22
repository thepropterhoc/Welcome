//
//  SeenBeforeViewController.m
//  Welcome
//
//  Created by Shelby Vanhooser on 12/22/14.
//  Copyright (c) 2014 Integrated Applications. All rights reserved.
//

#import "SeenBeforeViewController.h"

@interface SeenBeforeViewController ()

@property (strong, nonatomic) IBOutlet UITextField *lastNameField;
@property (strong, nonatomic) IBOutlet UIPickerView *visitorPicker;
@property (strong, nonatomic) IBOutlet UIButton *confirmButton;

@property int selectedPickerIndex;

@property (strong, nonatomic) NSArray *returnedVisitors;


@end

@implementation SeenBeforeViewController

-(void)viewDidLoad
{
  [super viewDidLoad];
  self.returnedVisitors = @[];
  self.selectedPickerIndex = -1;
  [self setConfirmVisitorVisible:NO];
}

-(void) setConfirmVisitorVisible:(BOOL)visible
{
  [self.visitorPicker setHidden:!visible];
  [self.confirmButton setHidden:!visible];
  [self.visitorPicker setUserInteractionEnabled:visible];
  [self.confirmButton setUserInteractionEnabled:visible];
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
  return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
  return self.returnedVisitors.count;
}

-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
  return ((Visitor*) self.returnedVisitors[row]).descriptionString;
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
  self.selectedPickerIndex = (int) row;
}

- (IBAction)search:(id)sender
{
  [self.lastNameField resignFirstResponder];
  [self setConfirmVisitorVisible:YES];
  
  self.returnedVisitors = @[];
  for(Visitor *v in [[Controller sharedInstance] allVisitors]){
    if([v.lastName.lowercaseString isEqualToString:self.lastNameField.text.lowercaseString]){
      self.returnedVisitors = [self.returnedVisitors arrayByAddingObject:v];
    }
  }
  
  [self.visitorPicker reloadAllComponents];
}

- (IBAction)confirmReturningUser:(id)sender
{
  [[Controller sharedInstance] setCurrentVisitorCheckingIn:self.returnedVisitors[self.selectedPickerIndex]];
}

- (IBAction)cancel:(id)sender
{
  [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
