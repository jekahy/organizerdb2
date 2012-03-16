//
//  selectedProjectViewController.m
//  organizerdb
//
//  Created by Жека Г on 3/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "selectedProjectViewController.h"
#import "ViewingViewController.h"
#import "recordInfo.h"

@implementation selectedProjectViewController
@synthesize tableView, records,projctName,login,myRecords,mutableDict;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableV{
    NSMutableSet *mutSet=[[[NSMutableSet alloc]init]autorelease];
    for (int i=0; i<[records count]; i++) {
        [mutSet addObject:[[records objectAtIndex:i]typee]];
    }
    
    return [[mutableDict valueForKey:@"types"]count];
    [mutSet release];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    //NSDictionary *tempDict=[];
    NSDictionary *tempDict=[mutableDict objectForKey:@"records"];
    int x=[[tempDict objectForKey:[[mutableDict valueForKey:@"types"]objectAtIndex:section]] count];
    return x;
    //int d=section;
    //
    //NSDictionary *tempDict2=[mutableDict objectForKey:@"records"];
   // NSString *title=[[tempDict2 valueForKey:[[mutableDict objectForKey:@"types"]objectAtIndex:[d]]]description] ;
    
    [tempDict release];
    
    //return [self.records count];
}

-(UITableViewCell*)tableView:(UITableView *)tableV cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier=@"Cell";
    UITableViewCell *cell=[tableV dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell==nil){
        cell=[[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier]autorelease];
        
    }
    NSDictionary *tempDict=[mutableDict objectForKey:@"records"];
    NSString *title=[[tempDict valueForKey:[[mutableDict objectForKey:@"types"]objectAtIndex:[indexPath row]]]description] ;
    NSLog(@"title %@",title);
    

         
    
    cell.textLabel.text=title;

    return cell;
    [title release];
}

-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    //NSDictionary *tempDict=[mutableDict objectForKey:@"records"];
    NSString *title=[[mutableDict objectForKey:@"types"]objectAtIndex:section] ;
    return title;
    
    
    [title release];
}

-(void)viewWillAppear:(BOOL)animated{
    myRecords=[[NSMutableArray alloc]init]; 
    NSLog(@"%@",[[records objectAtIndex:0] project]);
    for(int i=0;i<[records count];i++){
        if([[records objectAtIndex:i]project]==projctName){
            [myRecords addObject:[records objectAtIndex:i]];
            NSLog(@"%@",[[records objectAtIndex:i ]record]);
        }
    }
    NSLog(@"my records obj at index 0 %@",[[myRecords objectAtIndex:0] record]);
    NSLog(@"record obj 0 %@",[[records objectAtIndex:0] record]);
    //till here works fine!
    
    
    
    mutableDict=[[NSMutableDictionary alloc]init];
    [mutableDict setValue:myRecords forKey:projctName];
     NSMutableSet *mutSet=[[[NSMutableSet alloc]init]autorelease];
     for (int i=0; i<[records count]; i++) {
         [mutSet addObject:[[records objectAtIndex:i]typee]];
     }
     NSMutableDictionary *tempactivityDict=[[NSMutableDictionary alloc]init];
     NSMutableArray *tempActivityArray=[[NSMutableArray alloc]init];
     NSArray *tempArray=[[NSArray alloc]initWithArray:[mutSet allObjects]];
     
    NSLog(@"temparray obj0 %@",[tempArray objectAtIndex:0]);
    for(int i=0;i<[mutSet count];i++){
         for(int j=0;j<[myRecords count];j++){
             if([[[myRecords objectAtIndex:j]typee]isEqualToString:[tempArray objectAtIndex:i]]){
                 [tempActivityArray addObject:[[myRecords objectAtIndex:j]record]];
             }
         }
         [tempactivityDict setValue:tempActivityArray forKey:[tempArray objectAtIndex:i]];
         tempActivityArray=nil;
         
     }

     
     [mutableDict setValue:tempactivityDict forKey:@"records"];
     [mutableDict setValue:tempArray forKey:@"types"];
     [tempArray release];
     [tempActivityArray release];
     [tempactivityDict release];
    NSLog(@"view appeared animated");
    NSLog(@"types obj0 %@",[[mutableDict valueForKey:@"types"]objectAtIndex:0 ]);

 
 
 
 
 }






-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"selectedProjToVIewing"]){
        ViewingViewController *temView=[segue destinationViewController];
        [temView setLogin:login];
        [temView setProject:projctName];
        [temView setRecords:records];
    }
    
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    for(int i=0;i<=[[mutableDict objectForKey:@"types"]count];i++){
    NSLog(@"types %@",[[mutableDict objectForKey:@"types"]objectAtIndex:i]);
    }
    NSLog(@"view did load");
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    [mutableDict release];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
