//
//  EasyStore.h
//  EasyStore
//
//  Created by Jeremy Nortey on 9/28/13.
//  Copyright (c) 2013 Jeremy Nortey. All rights reserved.
//

#import <sqlite3.h>
#import <Foundation/Foundation.h>

#import "EasyConstants.h"
#import "Utility.h"
#import "TDTable.h"
#import "TDColumn.h"
#import "TDEntry.h"
#import "TDPredicate.h"

@interface EasyStore : NSObject{

}

/* Database creation methods */
+(void)beginDatabaseCreation;
+(void)completeDatabaseCreation;
+(void)deleteDatabaseFile;
+(TDTable*)createTableWithName:(NSString*)name;

/* Raw queries */
+(void)invokeRawQuery:(NSString*)query;
+(NSArray*)invokeRawSelectQuery:(NSString*)query;

/* Database modifier methods */
+(void)clearEasyStore;
+(void)insert:(TDEntry*)entry intoTable:(NSString*)tableName;
+(NSArray*)selectAllEntriesForTable:(NSString*)tableName;

/* Predicate methods */
+(NSArray*)selectEntriesWithPredicate:(TDPredicate*)predicate;
+(void)deleteEntriesWithPredicate:(TDPredicate*)predicate;
+(void)updateEntriesWithPredicate:(TDPredicate*)predicate;
+(int)countEntriesWithPredicate:(TDPredicate*)predicate;

/* Private Methods */
+(void)setEasyStoreStatus:(EasyStatus)status withError:(NSString*)error;

/* Properties */
+(EasyStatus)getStatus;
+(NSString*)getErrorMessage;

@end
