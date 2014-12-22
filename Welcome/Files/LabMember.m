//
//  LabMember.m
//  Welcome
//
//  Created by Shelby Vanhooser on 12/22/14.
//  Copyright (c) 2014 Integrated Applications. All rights reserved.
//

#import "LabMember.h"

@implementation LabMember

-(instancetype) init
{
  self = [super init];
  if(self){
    self.eyed = [NSUUID UUID].UUIDString;
  }
  return self;
}

+(instancetype)labMemberFromDictionary:(NSDictionary *)d
{
  LabMember *l = [[LabMember alloc] init];
  [l setValuesForKeysWithDictionary:d];
  return l;
}

-(NSDictionary *) dictionaryRepresentation
{
  NSMutableDictionary *d = [[NSMutableDictionary alloc] init];
  
  d[@"firstName"] = self.firstName;
  d[@"lastName"] = self.lastName;
  d[@"contactNumber"] = self.contactNumber;
  d[@"eyed"] = self.eyed;
  
  return d;
}

@end
