//
//  WelcomeViewController.m
//  Welcome
//
//  Created by Shelby Vanhooser on 12/18/14.
//  Copyright (c) 2014 Integrated Applications. All rights reserved.
//

#import "WelcomeViewController.h"
#import "AdminViewController.h"

@implementation WelcomeViewController

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
  if([[segue identifier] isEqualToString:@"export"]){
    ((AdminViewController *) [segue destinationViewController]).delegate = self;
  }
}

- (IBAction)tapped:(id)sender
{
  [self performSegueWithIdentifier:@"export" sender:self];
}
@end
