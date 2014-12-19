//
//  DataManager.m
//  Welcome
//
//  Created by Shelby Vanhooser on 12/18/14.
//  Copyright (c) 2014 Integrated Applications. All rights reserved.
//

#import "DataManager.h"

@interface DataManager ()

@property (strong, nonatomic) YapDatabase *database;
@property (strong, nonatomic) YapDatabaseConnection *connection;

@end

@implementation DataManager

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
  });
  return sharedInstance;
}

-(void) createNewVisitor:(Visitor*)v
{
  YapDatabaseConnection *connection = [self.database newConnection];
  
  [connection readWriteWithBlock:^(YapDatabaseReadWriteTransaction *transaction) {
    [transaction setObject:[v dictionaryRepresentation] forKey:v.eyed inCollection:@"visitors"];
  }];
}

-(void) updateVisitor:(Visitor*)v
{
  YapDatabaseConnection *connection = [self.database newConnection];
  
  [connection readWriteWithBlock:^(YapDatabaseReadWriteTransaction *transaction) {
    [transaction setObject:[v dictionaryRepresentation] forKey:v.eyed inCollection:@"visitors"];
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
      Visitor *v = [Visitor visitorFromDictionary:[transaction objectForKey:key inCollection:@"visitors"]];
      [retval addObject:v];
    }
  }];
  
  return retval;
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
