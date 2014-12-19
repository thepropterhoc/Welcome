//
//  Controller.h
//  Welcome
//
//  Created by Shelby Vanhooser on 12/18/14.
//  Copyright (c) 2014 Integrated Applications. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Controller : NSObject

+(instancetype) sharedInstance;
-(void) startCheckingInNewVisitor;
-(void) setNewVisitorFirstName:(NSString*)newFirstName;
-(void) setNewVisitorLastName:(NSString*)newLastName;
-(void) setNewVisitorCompanyName:(NSString*)newCompanyName;
-(void) setNewVisitorCompanyCity:(NSString*)newCompanyCity;

-(void) createDummy;
-(void) saveNewVisitor;
-(void) clearNewVisitor;

-(NSArray*) allVisitors;

@end
