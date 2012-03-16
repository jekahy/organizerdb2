//
//  ViewingViewController.m
//  organizerdb
//
//  Created by Жека Г on 3/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewingViewController.h"
#import "recordInfo.h"
#import "userdatabase.h"
#import "selectedProjectViewController.h"
#import "viewController2.h"

@implementation ViewingViewController
@synthesize tableView,records,projectArray,project,uniqueProjectArray,login,mutDict;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.uniqueProjectArray count];
}
-(UITableViewCell*)tableView:(UITableView *)tableV cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier=@"Cell";
    UITableViewCell *cell=[tableV dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell==nil){
        cell=[[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier]autorelease];
        
    }
    
    cell.textLabel.text=[uniqueProjectArray objectAtIndex:[indexPath row]];
    return cell;

}
/*
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableV{
   //NSMutableSet *mutSet=[[[NSMutableSet alloc]init]autorelease];
    for (int i=0; i<[records count]; i++) {
        [projectSet addObject:[[records objectAtIndex:i]project]];
    }
    
    return [projectSet count];
    
}
*/


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
     
             self.project=[uniqueProjectArray objectAtIndex:indexPath.row];
    NSLog(@"tableview didselec row project name is %@",project);         
    [self performSegueWithIdentifier:@"openProject" sender:self];
             
            
    
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"openProject"]){
        selectedProjectViewController *tempview=[segue destinationViewController];
        [tempview setProjctName:project];
        NSLog(@"%@",project);
        [tempview setLogin:login];
        [tempview setRecords:records];
        //[self.project retain];
        //[self viewDidUnload];
        
    }
    if([segue.identifier isEqualToString:@"toViewContr2"]){
        viewController2 *tempview=[segue destinationViewController];
        [tempview setLogin:login];
        [tempview viewWillAppear:YES];
        //[self.project retain];
        //[self viewDidUnload];

    }
}


- (void)viewDidLoad
{
    [super viewDidLoad];
   
    
    
}
-(void)viewWillAppear:(BOOL)animated{
    //[self viewWillAppear:YES];
    NSMutableSet *mutSet=[[NSMutableSet alloc]init];
    for (int i=0; i<[records count]; i++) {
        [mutSet addObject:[[records objectAtIndex:i]project]];
    }
   /* for (int i=0; i<[mutSet count]; i++) {
        if(self.projectArray containsObject:<#(id)#>)
        [self.projectArray addObject:[[mutSet objectAtIndex:i]project]];
    }
    self.projectArray=[mutSet allObjects];
    
    */
   /*
    NSArray *tempSetArray=[[NSArray alloc]initWithArray:[mutSet allObjects]];
    NSMutableArray *tempMutarray=[[NSMutableArray alloc]init];
    for(int i=0;i<[records count];i++){
        for(int j=0;j<[tempSetArray count];j++){
           if([[[records objectAtIndex:j] project]isEqualToString:[tempSetArray objectAtIndex:i]]){
               [tempMutarray addObject:[records objectAtIndex:j]];
               
           }
        }
        [mutDict setValue:tempMutarray forKey:[tempSetArray objectAtIndex:i]];
        tempMutarray=nil;
    }
    */
    
    
    self.uniqueProjectArray=[[NSArray alloc]initWithArray:[mutSet allObjects]];
    //NSLog(@"view will appear uniquenameprojectarray obj at index 1 %@",[uniqueProjectArray objectAtIndex:1]);
    //[mutSet release];
    //[self viewWillAppear:YES];
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    [uniqueProjectArray release];
    [records retain];
    
    
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
