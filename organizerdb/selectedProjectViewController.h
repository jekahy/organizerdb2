//
//  selectedProjectViewController.h
//  organizerdb
//
//  Created by Жека Г on 3/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//



@interface selectedProjectViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>{
    UITableView *tableView;
    NSArray *records;
    NSMutableArray *myRecords;
    
    NSString *projctName;
    NSString *login;
    NSMutableDictionary *mutableDict;
    
    
    
}
@property(nonatomic,retain)IBOutlet UITableView *tableView;
@property(nonatomic,retain)NSArray *records;
@property(nonatomic,retain)NSMutableArray *myRecords;
@property(nonatomic,retain)NSString *projctName;
@property(nonatomic,retain)NSString *login;
@property(nonatomic,retain)NSMutableDictionary *mutableDict;
@end
