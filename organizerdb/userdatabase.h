//
//  userdatabase.h
//  organizerdb
//
//  Created by Жека Г on 3/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "/usr/include/sqlite3.h"
#import "userinfo.h"




@interface UserDatabase : NSObject{
    sqlite3 *database;
    NSString *query;
}
@property(nonatomic,retain)NSString *query;

+(UserDatabase *)database;
-(NSArray *)getallusers;
//+(UserDatabase *)database;
-(void)reg:(NSString*)name password:(NSString*)passowrd;
-(void)addRecord:(NSString*)login date:(NSString*)date project:(NSString*)project type:(NSString*)type duration:(NSString*)duration record:(NSString*)record;
-(void)copyDbIfNeeded;
-(NSArray*)getAllData:(NSString*)login date:(NSString*)date;

-(NSString*)getPath;

@end
