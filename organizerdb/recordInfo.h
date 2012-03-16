//
//  recordInfo.h
//  organizerdb
//
//  Created by Жека Г on 3/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//



@interface recordInfo : NSObject{
    NSString *date;
    NSString *project;
    NSString *typee;
    NSString *time;
    NSString *record;
}
@property (nonatomic,retain)NSString *date;
@property (nonatomic,retain)NSString *project;
@property (nonatomic,retain)NSString *typee;
@property (nonatomic,retain)NSString *time;
@property (nonatomic,retain)NSString *record;

-(id)create:(NSString*)date project:(NSString*)project type:(NSString*)typee time:(NSString*)time record:(NSString*)record;

@end
