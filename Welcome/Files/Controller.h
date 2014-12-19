//
//  Controller.h
//  Welcome
//
//  Created by Shelby Vanhooser on 12/18/14.
//  Copyright (c) 2014 Integrated Applications. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MessageUI/MessageUI.h>
#import "Visitor.h"

@interface Controller : NSObject

+(instancetype) sharedInstance;
-(void) startCheckingInNewVisitor;
-(void) setNewVisitorFirstName:(NSString*)newFirstName;
-(void) setNewVisitorLastName:(NSString*)newLastName;
-(void) setNewVisitorCompanyName:(NSString*)newCompanyName;
-(void) setNewVisitorCompanyCity:(NSString*)newCompanyCity;
-(void) checkNewVisitorIn;

-(void) createDummy;
-(Visitor*) saveNewVisitor;
-(void) clearNewVisitor;
-(void) clearAllVisitors;

-(NSArray*) allVisitors;

@end
