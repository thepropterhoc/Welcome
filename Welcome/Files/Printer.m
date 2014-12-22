//
//  Printer.m
//  Welcome
//
//  Created by Shelby Vanhooser on 12/22/14.
//  Copyright (c) 2014 Integrated Applications. All rights reserved.
//

#import "Printer.h"

@interface Printer ()

@property (strong, nonatomic) UIPrintInteractionController *printController;
@property (strong, nonatomic) NSString *markupString;
@property (strong, nonatomic) UIPrinter *selectedPrinter;

@end

@implementation Printer

+(instancetype) sharedInstance
{
  static dispatch_once_t dispatchToken = 0;
  static Printer *sharedInstance = nil;
  dispatch_once(&dispatchToken, ^{
    sharedInstance = [[Printer alloc] init];
    sharedInstance.printController = [[UIPrintInteractionController alloc] init];
    sharedInstance.markupString = @"";
    sharedInstance.selectedPrinter = nil;
  });
  return sharedInstance;
}

-(void) printBadgeForVisitor:(Visitor *)v
{
  UIMarkupTextPrintFormatter *formatter = [[UIMarkupTextPrintFormatter alloc] initWithMarkupText:self.markupString];
  formatter.contentInsets = UIEdgeInsetsMake(72, 72, 72, 72); // 1" margins
  
  self.printController.printFormatter = formatter;
  
  [self.printController printToPrinter:self.selectedPrinter completionHandler:^(UIPrintInteractionController *printInteractionController, BOOL completed, NSError *error) {
    
  }];
}

@end
