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

- (IBAction)export:(id)sender
{
  
  NSArray *rows = @[];
  for(Visitor *v in [[Controller sharedInstance] allVisitors]){
    for(NSString *date in v.visitDates){
      CSVRow *row = [[CSVRow alloc] initWithValues:@[v.firstName, v.lastName, v.companyName, v.companyCity, date]];
      rows = [rows arrayByAddingObject:row];
    }
  }
  CSVTable *table = [[CSVTable alloc] initWithRows:rows];
  NSMutableString *output = [[NSMutableString alloc] init];
  CSVSerializer *serializer = [[CSVSerializer alloc] initWithOutput:output];
  [serializer serialize:table];
  
  MFMailComposeViewController *compose = [[MFMailComposeViewController alloc] init];
  [compose setSubject:@"All Visitors"];
  [compose setTitle:@"Send visitor list"];
  [compose addAttachmentData:[output dataUsingEncoding:NSUTF8StringEncoding] mimeType:@"text/csv" fileName:@"visitors.csv"];
  [compose setMessageBody:@"Attached are all visitors to the lab as of today.\n\nCheers,\n\nThe Welcome App" isHTML:NO];
  [compose setMailComposeDelegate:self];
  [self presentViewController:compose animated:YES completion:^{
    [[[UIAlertView alloc] initWithTitle:@"Export" message:[NSString stringWithFormat:@"Enter recipient of emailed list"] delegate:nil cancelButtonTitle:@"Got it" otherButtonTitles:nil] show];
  }];
}

-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
  [self dismissViewControllerAnimated:YES completion:^{
    
  }];
}

- (IBAction)clear:(id)sender
{
  [[Controller sharedInstance] clearAllVisitors];
  [[[UIAlertView alloc] initWithTitle:@"Success" message:[NSString stringWithFormat:@"Database cleared"] delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles:nil] show];
}
@end
