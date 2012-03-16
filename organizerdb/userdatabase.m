//
//  userdatabase.m
//  organizerdb
//
//  Created by Жека Г on 3/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "userdatabase.h"
#import "userinfo.h"
#import "recordInfo.h"


@implementation UserDatabase
@synthesize query;
static UserDatabase *database;
-(NSString*)getPath{
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docDir=[paths objectAtIndex:0];
    NSLog(@"*****##:%@",docDir);
    return [docDir stringByAppendingPathComponent:@"userdb.sqlite3"];
    
    
}



-(void)copyDbIfNeeded{
    NSFileManager *fileMan=[NSFileManager defaultManager];
    NSError *error;
    NSString *path=[self getPath];
    BOOL succes=[fileMan fileExistsAtPath:path];
    if (!succes) {
        NSString *defaultDbPath=[[[NSBundle mainBundle]resourcePath]stringByAppendingPathComponent:@"userdb.sqlite3"];
        succes=[fileMan copyItemAtPath:defaultDbPath toPath:path error:&error];
        NSLog(@"db copied from bundle to path %@",path);
        if(!succes) NSLog(@"failed to create writable db file with error %@ ", [error localizedDescription]);
        
        
    } else{
        NSLog(@"db found at path %@",path);
    }
}

+(UserDatabase *)database{
    if(database==nil){
        database=[[UserDatabase alloc]init];
    }
    return database;
    
    
}


-(id)init{
    self=[super init];
    
    if(self){
       
        NSString *path=[self getPath];
        if(sqlite3_open([path UTF8String], &database)!=SQLITE_OK){
            NSLog(@"Failed to load database!\n");
        }
        NSLog(@"database did load correctly!!!!");
        
    }
    
    [self copyDbIfNeeded]; 
    return self;
    
    
}

-(NSArray *)getallusers{
    NSMutableArray *returnall=[[NSMutableArray alloc]init];
    query=@"SELECT * FROM users3";
    sqlite3_stmt *statement;
    if((sqlite3_prepare_v2(database, [query UTF8String], -1, &statement, nil))==SQLITE_OK){
        while (sqlite3_step(statement)==SQLITE_ROW) {
            int uniqueid=sqlite3_column_int(statement, 0);
            char *loginchars=(char*)sqlite3_column_text(statement, 1);
            char *passwordchars=(char*)sqlite3_column_text(statement, 2);
            NSString *login=[[NSString alloc]initWithUTF8String:loginchars];
            NSString *password=[[NSString alloc]initWithUTF8String:passwordchars];
            
            
            
            
            
            userinfo *info=[[userinfo alloc]create:uniqueid login:login password:password];
            [returnall addObject:info];
            [login release];
            [password release];
            [info release];
        }
        sqlite3_finalize(statement);
    }
    NSLog(@"%@",returnall);
    return returnall;
}

-(void)reg:(NSString *)name password:(NSString *)passowrd{
    //int p=1;
    NSString *insertSqlLog=[ NSString stringWithFormat:@"INSERT INTO users3(login,password) VALUES('%@','%@');",name,passowrd];
    //static sqlite3_stmt *statement;
    char *error;
    //NSString *insertSqlRecord=[ NSString stringWithFormat:@"INSERT INTO users4(login) VALUES('%@');",name];
    NSString *createTable=[NSString stringWithFormat:@"CREATE  TABLE '%@' (date TEXT,project TEXT,type TEXT,time TEXT, record TEXT)",name];
    
    
    if((sqlite3_exec(database, [insertSqlLog UTF8String], NULL, NULL, &error)==SQLITE_OK) && sqlite3_exec(database, [createTable UTF8String], NULL, NULL, NULL)==SQLITE_OK){
     
        NSLog(@"sqlite3 record was added successfully!");
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"record" message:@"record was added successfully" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil];
        [alert show];
        [alert release];
        alert=nil;
        
    } else {
       
     UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"record" message:@"record was not added" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil];
        [alert show];
        [alert release];
        alert=nil;
    
    }
    
    

   
    

}

-(void)addRecord:(NSString*)login date:(NSString*)date project:(NSString*)project type:(NSString*)type duration:(NSString*)duration record:(NSString*)record{
    
    NSString *insertSqlRecord=[ NSString stringWithFormat:@"INSERT INTO '%@' (date,project,type,time,record) VALUES('%@','%@','%@','%@','%@');",login,date,project,type,duration,record];
    if(sqlite3_exec(database, [insertSqlRecord UTF8String], NULL, NULL, NULL)==SQLITE_OK){
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"record" message:@"record successfully added!" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil];
        [alert show];
        [alert release];
        alert=nil;
    } else {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"record" message:@"record was not added!" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil];
        [alert show];
        [alert release];
        alert=nil;
    }
}
-(NSArray*)getAllData:(NSString*)login date:(NSString*)date{
    NSMutableArray *returnall=[[NSMutableArray alloc]init];
    query= [NSString stringWithFormat:@"SELECT * FROM '%@' WHERE date='%@'",login,date];
    sqlite3_stmt *statement;
    if((sqlite3_prepare_v2(database, [query UTF8String], -1, &statement, nil))==SQLITE_OK){
        while (sqlite3_step(statement)==SQLITE_ROW) {
            
            char *recordChars=(char*)sqlite3_column_text(statement, 4);
            char *typeChars=(char*)sqlite3_column_text(statement, 2);
            char *projectChars=(char*)sqlite3_column_text(statement, 1);


            char *dateChars=(char*)sqlite3_column_text(statement, 0);
            char *timeChars=(char*)sqlite3_column_text(statement, 3);
            NSString *date=[[NSString alloc]initWithUTF8String:dateChars];
            NSString *project=[[NSString alloc]initWithUTF8String:projectChars];
            NSString *type=[[NSString alloc]initWithUTF8String:typeChars];
            NSString *time=[[NSString alloc]initWithUTF8String:timeChars];
            NSString *record=[[NSString alloc]initWithUTF8String:recordChars];
            
            
            
            
            //userinfo *info=[[userinfo alloc]];
            recordInfo *info=[[recordInfo alloc]create:date project:project type:type time:time record:record];
            [returnall addObject:info];
           [date release];
            [project release];
            [info release];
            [type release];
            [time release];
            [record release];
            //[query release];
            //query=nil;
        }
        sqlite3_finalize(statement);
    }
    NSLog(@"%@",returnall);
    //sqlite3_close(database);
    return returnall;
    //[self dealloc];

}

/*
CREATE  TABLE "main"."users4" ("login" TEXT, "date" DATETIME, "record" TEXT)
*/
-(void)dealloc{
    

    
    [query release];
    //query=nil;
    sqlite3_close(database);
    [super dealloc];
    
}





@end
