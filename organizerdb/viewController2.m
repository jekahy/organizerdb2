//
//  viewController2.m
//  organizerdb
//
//  Created by Жека Г on 3/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "viewController2.h"
#import "ViewController.h"
#import "addNewRecordViewController.h"
#import "userdatabase.h"
#import "recordInfo.h"
#import "ViewingViewController.h"


@implementation viewController2
@synthesize login,label,showDate,image,navItem,datePicker,date,showButton,records;

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"add"]){
        addNewRecordViewController *tempView=[segue destinationViewController];
        [tempView setLogin:login];
        [tempView setDate:self.date];
        
    }
    if([segue.identifier isEqualToString:@"toViewContr"]){
        ViewingViewController *tempView=[segue destinationViewController];
        [tempView setRecords:self.records];
        [self.login retain];
        [tempView setLogin:login];
        
        

    }
}
-(IBAction)show{
    self.records=[[UserDatabase database]getAllData:login date:date];
    [self performSegueWithIdentifier:@"toViewContr" sender:self];


}

-(IBAction)add:(id)sender{
    [self performSegueWithIdentifier:@"add" sender:self];
}


-(IBAction)pickerChanged:(id)sender{
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    
    
    date=[dateFormatter stringFromDate:[datePicker date]];
    NSLog(@"%@",date);
    [dateFormatter release];
    
}

-(void)changeNavItemTitle:(NSString *)title{
    [navItem setTitle:title];
    [label setText:title];
    NSLog(@"title setted!");
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc]init];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    
    
    NSString *date=[dateFormatter stringFromDate:[datePicker date]];
    NSLog(@"%@",date);
    [dateFormatter release];
    
}

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

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    
    NSLog(@"%@",self.login);
    

    [super viewDidLoad];
    
}

-(void)dealloc{
    [image release];
    [super release];
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.label setText:self.login];
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    
    
    self.date=[dateFormatter stringFromDate:[datePicker date]];
    NSLog(@"%@",date);
    [dateFormatter release];
    //[self.label setText:[ViewController ]]
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

@end

