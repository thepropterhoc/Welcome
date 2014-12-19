//
//  Visitor.h
//  Welcome
//
//  Created by Shelby Vanhooser on 12/18/14.
//  Copyright (c) 2014 Integrated Applications. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Visitor : NSObject

@property (strong, nonatomic) NSString *firstName;
@property (strong, nonatomic) NSString *lastName;
@property (strong, nonatomic) NSString *companyName;
@property (strong, nonatomic) NSString *companyCity;
@property (strong, nonatomic) NSArray *visitDates;
@property (strong, nonatomic) NSString *eyed;

+(instancetype)visitorFromDictionary:(NSDictionary*)d;
-(NSDictionary *) dictionaryRepresentation;
-(void) checkInNow;

@end
