//
//  EasyTable.h
//  EasyStore
//
//  Created by Jeremy Nortey on 9/28/13.
//  Copyright (c) 2013 Jeremy Nortey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TKColumn.h"

@interface EasyTable : NSObject{
    NSString* _name;
    NSMutableArray* _columns;
}


-(id)initWithName:(NSString*)name;

/* Create columns */
-(TKColumn*)createColumnWithName:(NSString*)name withType:(int)type;
-(TKColumn*)createStringColumnWithName:(NSString*)name;
-(TKColumn*)createIntegerColumnWithName:(NSString*)name;
-(TKColumn*)createBooleanColumnWithName:(NSString*)name;
-(TKColumn*)createDateColumnWithName:(NSString*)name;
-(TKColumn*)createFloatColumnWithName:(NSString*)name;

/* Other public methods */
-(void)addIdentityColumn;

/* Private Methods */
-(NSString*)getCreationString;

/* Properties */
-(NSString*)getName;

@end
