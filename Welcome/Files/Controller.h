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
#import "LabMember.h"
#import "DataManager.h"
#import "Printer.h"

@interface Controller : NSObject

+(instancetype) sharedInstance;

-(void) startCheckingInNewVisitor;

-(void) setNewVisitorFirstName:(NSString*)newFirstName;
-(void) setNewVisitorLastName:(NSString*)newLastName;
-(void) setNewVisitorCompanyName:(NSString*)newCompanyName;
-(void) setNewVisitorCompanyCity:(NSString*)newCompanyCity;
-(void) setNewVisitorCell:(NSString*)cell;
-(void) setnewVisitorEmail:(NSString*)email;
-(void) checkNewVisitorIn;

-(void) setCurrentVisitorCheckingIn:(Visitor*)v;

-(void) createDummy;

-(Visitor*) saveNewVisitor;
-(void) clearNewVisitor;
-(void) clearAllVisitors;
-(NSArray*) allVisitors;
-(Visitor*) updateReturningVisitor;

-(Visitor*) currentVisitor;

-(NSArray*) allLabMembers;

@end
