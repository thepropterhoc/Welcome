//
//  Controller.m
//  Welcome
//
//  Created by Shelby Vanhooser on 12/18/14.
//  Copyright (c) 2014 Integrated Applications. All rights reserved.
//

#import "Controller.h"
#import "Visitor.h"
#import "DataManager.h"

@interface Controller ()

@property (strong, nonatomic) Visitor *checkingInUser;

@end

@implementation Controller

+(instancetype) sharedInstance
{
  static dispatch_once_t dispatchToken = 0;
  static Controller *sharedInstance = nil;
  dispatch_once(&dispatchToken, ^{
    sharedInstance = [[Controller alloc] init];
  });
  return sharedInstance;
}

-(void) createDummy
{
  NSDictionary *d = @{
                      @"firstName" : @"Shelby",
                      @"lastName" : @"Vanhooser",
                      @"companyCity" : @"Enid",
                      @"companyName" : @"Integrated Applications",
                      @"visitDates" : @[]
                      };
  Visitor *v = [Visitor visitorFromDictionary:d];
  [v checkInNow];
  self.checkingInUser = v;
}

-(NSArray*) allVisitors
{
  return [[DataManager sharedInstance] readAllVisitors];
}

-(void) startCheckingInNewVisitor
{
  self.checkingInUser = [[Visitor alloc] init];
}

-(void) setNewVisitorFirstName:(NSString*)newFirstName
{
  self.checkingInUser.firstName = newFirstName;
  NSLog(@"Did set to first name : %@", newFirstName);
}

-(void) setNewVisitorLastName:(NSString*)newLastName
{
  self.checkingInUser.lastName = newLastName;
}

-(void) setNewVisitorCompanyName:(NSString*)newCompanyName
{
  self.checkingInUser.companyName = newCompanyName;
}

-(void) setNewVisitorCompanyCity:(NSString*)newCompanyCity
{
  self.checkingInUser.companyCity = newCompanyCity;
}

-(void) clearNewVisitor
{
  self.checkingInUser = nil;
}

-(void) saveNewVisitor
{
  [[DataManager sharedInstance] createNewVisitor:self.checkingInUser];
}

@end
