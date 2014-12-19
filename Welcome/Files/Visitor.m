//
//  Visitor.m
//  Welcome
//
//  Created by Shelby Vanhooser on 12/18/14.
//  Copyright (c) 2014 Integrated Applications. All rights reserved.
//

#import "Visitor.h"

@implementation Visitor

-(instancetype) init
{
  self = [super init];
  if(self){
    self.visitDates = [[NSArray alloc] init];
    self.eyed = [NSUUID UUID].UUIDString;
  }
  return self;
}

+(instancetype)visitorFromDictionary:(NSDictionary*)d
{
  Visitor *v = [[Visitor alloc] init];
  [v setValuesForKeysWithDictionary:d];
  return v;
}

-(void) checkInNow
{
  self.visitDates = [self.visitDates arrayByAddingObject:[NSDate date]];
}

-(NSDictionary *) dictionaryRepresentation
{
  NSMutableDictionary *d = [[NSMutableDictionary alloc] init];
  
  d[@"firstName"] = self.firstName;
  d[@"lastName"] = self.lastName;
  d[@"companyName"] = self.companyName;
  d[@"companyCity"] = self.companyCity;
  d[@"visitDates"] = self.visitDates;
  d[@"eyed"] = self.eyed;
  
  return d;
}
    
    /*
     @property (strong, nonatomic) NSString *firstName;
     @property (strong, nonatomic) NSString *lastName;
     @property (strong, nonatomic) NSString *companyName;
     @property (strong, nonatomic) NSString *companyCity;
     @property (strong, nonatomic) NSArray *visitDates;
     @property (strong, nonatomic) NSUUID *eyed;
     */

@end
