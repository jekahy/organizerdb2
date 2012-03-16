//
//  ViewingViewController.h
//  organizerdb
//
//  Created by Жека Г on 3/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//



@interface ViewingViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>{
    UITableView *tableView;
    NSArray *records;
    NSMutableArray *projectArray;
    NSMutableDictionary *mutDict;
    NSString *project;
    NSArray *uniqueProjectArray;
    NSString *login;
}
@property(nonatomic,retain)IBOutlet UITableView *tableView;
@property(nonatomic,retain)NSArray *records;
@property(nonatomic,retain)NSArray *uniqueProjectArray;
@property(nonatomic,retain)NSMutableArray *projectArray;
@property(nonatomic,retain)NSString *project;
@property(nonatomic,retain)NSString *login;
@property(nonatomic,retain) NSMutableDictionary *mutDict;


@end
