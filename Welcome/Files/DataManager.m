//
//  DataManager.m
//  Welcome
//
//  Created by Shelby Vanhooser on 12/18/14.
//  Copyright (c) 2014 Integrated Applications. All rights reserved.
//

#import "DataManager.h"

#pragma mark - Global Variable Declarations

@interface DataManager ()

@property (strong, nonatomic) YapDatabase *database;
@property (strong, nonatomic) YapDatabaseConnection *connection;

@property (strong, nonatomic) NSString *visitorCollection;
@property (strong, nonatomic) NSString *labMemberCollection;

@end

@implementation DataManager

#pragma mark - Static Initialization

+(instancetype) sharedInstance
{
  static dispatch_once_t dispatchToken = 0;
  static DataManager *sharedInstance = nil;
  dispatch_once(&dispatchToken, ^{
    sharedInstance = [[DataManager alloc] init];
    NSArray *paths = NSSearchPathForDirectoriesInDomains
    (NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *path = [NSString stringWithFormat:@"%@/database.db", documentsDirectory];
    sharedInstance.database = [[YapDatabase alloc] initWithPath:path];
    sharedInstance.visitorCollection = @"visitors";
    sharedInstance.labMemberCollection = @"labMembers";
  });
  return sharedInstance;
}

#pragma mark - Visitor Methods

-(void) createNewVisitor:(Visitor*)v
{
  YapDatabaseConnection *connection = [self.database newConnection];
  
  [connection readWriteWithBlock:^(YapDatabaseReadWriteTransaction *transaction) {
    [transaction setObject:[v dictionaryRepresentation] forKey:v.eyed inCollection:self.visitorCollection];
  }];
}

-(void) updateVisitor:(Visitor*)v
{
  YapDatabaseConnection *connection = [self.database newConnection];
  
  [connection readWriteWithBlock:^(YapDatabaseReadWriteTransaction *transaction) {
    [transaction setObject:[v dictionaryRepresentation] forKey:v.eyed inCollection:self.visitorCollection];
  }];
}

-(NSArray*) readAllVisitors
{
  YapDatabaseConnection *connection = [self.database newConnection];
  
  NSMutableArray *retval = [[NSMutableArray alloc] init];
  __block NSArray *keys = nil;
  [connection readWithBlock:^(YapDatabaseReadTransaction *transaction) {
    keys = [transaction allKeysInCollection:@"visitors"];
  }];
  
  [connection readWithBlock:^(YapDatabaseReadTransaction *transaction) {
    for(NSString *key in keys){
      Visitor *v = [Visitor visitorFromDictionary:[transaction objectForKey:key inCollection:self.visitorCollection]];
      [retval addObject:v];
    }
  }];
  
  return retval;
}

-(void) clearAllVisitors
{
  YapDatabaseConnection *connection = [self.database newConnection];
  
  __block NSArray *keys = nil;
  [connection readWithBlock:^(YapDatabaseReadTransaction *transaction) {
    keys = [transaction allKeysInCollection:self.visitorCollection];
  }];
  
  [connection readWriteWithBlock:^(YapDatabaseReadWriteTransaction *transaction) {
    for(NSString *key in keys){
      [transaction setObject:nil forKey:key inCollection:self.visitorCollection];
    }
  }];
}

#pragma mark - Lab Member Methods

-(void) createNewLabMember:(LabMember*)l
{
  YapDatabaseConnection *connection = [self.database newConnection];
  
  [connection readWriteWithBlock:^(YapDatabaseReadWriteTransaction *transaction) {
    [transaction setObject:[l dictionaryRepresentation] forKey:l.eyed inCollection:self.labMemberCollection];
  }];
}

-(void) updateLabMember:(LabMember*)l
{
  YapDatabaseConnection *connection = [self.database newConnection];
  
  [connection readWriteWithBlock:^(YapDatabaseReadWriteTransaction *transaction) {
    [transaction setObject:[l dictionaryRepresentation] forKey:l.eyed inCollection:self.labMemberCollection];
  }];
}

-(NSArray*) readAllLabMembers
{
  YapDatabaseConnection *connection = [self.database newConnection];
  
  NSMutableArray *retval = [[NSMutableArray alloc] init];
  __block NSArray *keys = nil;
  [connection readWithBlock:^(YapDatabaseReadTransaction *transaction) {
    keys = [transaction allKeysInCollection:self.labMemberCollection];
  }];
  
  [connection readWithBlock:^(YapDatabaseReadTransaction *transaction) {
    for(NSString *key in keys){
      LabMember *l = [LabMember labMemberFromDictionary:[transaction objectForKey:key inCollection:self.labMemberCollection]];
      [retval addObject:l];
    }
  }];
  
  return retval;
}

-(void) deleteLabMember:(LabMember *)l
{
  
  YapDatabaseConnection *connection = [self.database newConnection];
  
  [connection readWriteWithBlock:^(YapDatabaseReadWriteTransaction *transaction) {
      [transaction setObject:nil forKey:l.eyed inCollection:self.labMemberCollection];
  }];
}

/*
 // Create and/or Open the database file
 YapDatabase *database = [[YapDatabase alloc] initWithPath:databasePath];
 
 // Get a connection to the database (can have multiple for concurrency)
 YapDatabaseConnection *connection = [database newConnection];
 
 // Add an object
 [connection readWriteWithBlock:^(YapDatabaseReadWriteTransaction *transaction) {
 [transaction setObject:@"Hello" forKey:@"World" inCollection:@"example1"];
 }];
 
 // Read it back
 [connection readWithBlock:^(YapDatabaseReadTransaction *transaction) {
 NSLog(@"%@ World", [transaction objectForKey:@"World" inCollection:@"example1"]);
 }];
 */

@end
