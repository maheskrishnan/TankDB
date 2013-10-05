//
//  EasyStoreTests.m
//  EasyStoreTests
//
//  Created by Jeremy Nortey on 9/28/13.
//  Copyright (c) 2013 Jeremy Nortey. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "EasyStore.h"
#import "EasyColumn.h"

@interface CreateTests : XCTestCase

@end

@implementation CreateTests

- (void)setUp{
    [super setUp];
    [EasyStore clearEasyStore];
}

- (void)tearDown{
    [super tearDown];
    [EasyStore clearEasyStore];
}

- (void)testCreateTableAndColumns{
    EasyTable *table = [EasyStore createTableWithName:@"Users"];
    EasyColumn* nameColumn = [table createColumnWithName:@"name" withType:EasyString];
    EasyColumn* amountColumn = [table createColumnWithName:@"amount" withType:EasyInteger];
    
    XCTAssertEqualObjects([nameColumn getName], @"name", @"Column name incorrect");
    XCTAssertEqualObjects([amountColumn getName], @"amount", @"Column name incorrect");
    
    XCTAssertEqual([nameColumn getType], EasyString, @"Column type incorrect");
    XCTAssertEqual([amountColumn getType], EasyInteger, @"Column type incorrect");
}

- (void)testCreateEasyStore{
    [EasyStore beginDatabaseCreation];
    
    EasyTable *table = [EasyStore createTableWithName:@"Users"];
    [table createColumnWithName:@"name" withType:EasyString];
    [table createColumnWithName:@"amount" withType:EasyInteger];
    
    [EasyStore completeDatabaseCreation];
    
    XCTAssertEqual([EasyStore getStatus], Easy_OK, @"Status is not Easy_OK");
    XCTAssertEqualObjects([EasyStore getErrorMessage], @"", @"Error message is not empty");
}

- (void)testCreateTableWithIdentity{
    [EasyStore beginDatabaseCreation];
    
    EasyTable *table = [EasyStore createTableWithName:@"Users"];
    EasyColumn* identityColumn = [table createColumnWithName:@"id" withType:EasyInteger];
    [table createColumnWithName:@"name" withType:EasyString];
    [table createColumnWithName:@"amount" withType:EasyInteger];
    
    [identityColumn setAsIdentityColumn];
    
    [EasyStore completeDatabaseCreation];
    
    XCTAssertEqual([EasyStore getStatus], Easy_OK, @"Status is not Easy_OK");
    XCTAssertEqualObjects([EasyStore getErrorMessage], @"", @"Error message is not empty");
}

- (void)testCreateTableWithBuiltInIdentity{
    [EasyStore beginDatabaseCreation];
    
    EasyTable *table = [EasyStore createTableWithName:@"Users"];
    
    [table addIdentityColumn];
    [table createColumnWithName:@"name" withType:EasyString];
    [table createColumnWithName:@"amount" withType:EasyInteger];
    
    [EasyStore completeDatabaseCreation];
    
    XCTAssertEqual([EasyStore getStatus], Easy_OK, @"Status is not Easy_OK");
    XCTAssertEqualObjects([EasyStore getErrorMessage], @"", @"Error message is not empty");
}

- (void)testCreateTableWithPrimaryKey{
    [EasyStore beginDatabaseCreation];
    
    EasyTable *table = [EasyStore createTableWithName:@"Users"];
    
    [[table createColumnWithName:@"name" withType:EasyString] setAsPrimaryKey];
    [table createColumnWithName:@"amount" withType:EasyInteger];
    
    [EasyStore completeDatabaseCreation];
    
    XCTAssertEqual([EasyStore getStatus], Easy_OK, @"Status is not Easy_OK");
    XCTAssertEqualObjects([EasyStore getErrorMessage], @"", @"Error message is not empty");
}



@end
