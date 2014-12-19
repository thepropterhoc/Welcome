//
//  NameViewController.m
//  Welcome
//
//  Created by Shelby Vanhooser on 12/18/14.
//  Copyright (c) 2014 Integrated Applications. All rights reserved.
//

#import "NameViewController.h"
#import "Visitor.h"

@implementation NameViewController

-(void)viewDidLoad
{
  [super viewDidLoad];
  /*
  [[Controller sharedInstance] createDummy];
  [[Controller sharedInstance] saveNewVisitor];
  for(Visitor *v in [[Controller sharedInstance] allVisitors]){
    NSLog(@"Visitor : %@", [v dictionaryRepresentation]);
  }
   */
 // NSLog(@"All visitors : %@", );
}

- (IBAction)next:(id)sender
{
  [[Controller sharedInstance] setNewVisitorFirstName:self.firstNameField.text];
  [[Controller sharedInstance] setNewVisitorLastName:self.lastNameField.text];
  [self performSegueWithIdentifier:@"pushToCompany" sender:self];
}
@end
