//
//  LabMember.h
//  Welcome
//
//  Created by Shelby Vanhooser on 12/22/14.
//  Copyright (c) 2014 Integrated Applications. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LabMember : NSObject

@property (strong, nonatomic) NSString *firstName;
@property (strong, nonatomic) NSString *lastName;
@property (strong, nonatomic) NSString *contactNumber;
@property (strong, nonatomic) NSString *eyed;

+(instancetype)labMemberFromDictionary:(NSDictionary*)d;
-(NSDictionary *) dictionaryRepresentation;

@end
