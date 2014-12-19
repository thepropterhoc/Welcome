//
//  AdminViewController.m
//  Welcome
//
//  Created by Shelby Vanhooser on 12/18/14.
//  Copyright (c) 2014 Integrated Applications. All rights reserved.
//

#import "AdminViewController.h"

@implementation AdminViewController

- (IBAction)back:(id)sender
{
  [self.delegate.navigationController dismissViewControllerAnimated:YES completion:nil];
}
@end
