//
//  EasyEntry.h
//  EasyStore
//
//  Created by Jeremy Nortey on 9/29/13.
//  Copyright (c) 2013 Jeremy Nortey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EasyEntry : NSObject{
    NSMutableDictionary* entryDicitonary;
}

/* Public Methods */
-(void)setString:(NSString*)string forColumnName:(NSString*)columnName;
-(void)setNumber:(int)number forColumnName:(NSString*)columnName;

-(NSString*)getStringForColumnName:(NSString*)columnName;
-(int)getNumberForColumnName:(NSString*)columnName;

/* Properties */
-(NSMutableDictionary*)getEntries;


@end