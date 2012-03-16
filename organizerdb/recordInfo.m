//
//  recordInfo.m
//  organizerdb
//
//  Created by Жека Г on 3/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "recordInfo.h"

@implementation recordInfo
@synthesize date,typee,project,time,record;

-(id)create:(NSString *)date project:(NSString *)project type:(NSString *)typee time:(NSString *)time record:(NSString *)record{
    self=[super init];
    if(self){
    self.date=date;
    self.project=project;
    self.time=time;
    self.typee=typee;
    self.record=record;
    }
    return self;
}

-(void)dealloc{
    [date release];
    [time release];
    [typee release];
    [record release];
    [project release];
    [super dealloc];
}

@end
