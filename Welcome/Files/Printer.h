//
//  Printer.h
//  Welcome
//
//  Created by Shelby Vanhooser on 12/22/14.
//  Copyright (c) 2014 Integrated Applications. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Visitor.h"

@interface Printer : NSObject

+(instancetype)sharedInstance;
-(void)printBadgeForVisitor:(Visitor*)v;

@end
