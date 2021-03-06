//
//  DataManager.h
//  Welcome
//
//  Created by Shelby Vanhooser on 12/18/14.
//  Copyright (c) 2014 Integrated Applications. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <YapDatabase/YapDatabase.h>
#import "Visitor.h"
#import "LabMember.h"

@interface DataManager : NSObject

+(instancetype) sharedInstance;


-(void) createNewVisitor:(Visitor*)v;
-(void) updateVisitor:(Visitor*)v;
-(NSArray*) readAllVisitors;
-(void) clearAllVisitors;

-(void) createNewLabMember:(LabMember*)l;
-(void) updateLabMember:(LabMember*)l;
-(void) deleteLabMember:(LabMember*)l;
-(NSArray*) readAllLabMembers;

@end
