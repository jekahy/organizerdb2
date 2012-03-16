//
//  ViewController.m
//  organizerdb
//
//  Created by Жека Г on 3/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "userinfo.h"
#import "userdatabase.h"
#import "viewController2.h"



@implementation ViewController


@synthesize usernameField;
@synthesize userpasswordField;
@synthesize loginButton;
@synthesize login;

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"tomain"]){
        viewController2 *tempView=[segue destinationViewController];
        [tempView setLogin:login];
    }
}







-(IBAction) login: (id) sender{

    NSArray *allusers=[[UserDatabase database]getallusers];
    NSString *log=[usernameField text];
    NSString *password=[userpasswordField text];
    UIAlertView *alert;
    viewController2 *tempView=[[viewController2 alloc]initWithNibName:@"viewController2" bundle:nil];
    
        if([log isEqualToString: @"newuser"]){
            
                if([password isEqualToString: @"guest"]){
                    [self performSegueWithIdentifier:@"register" sender:self];
                } else alert=[[UIAlertView alloc]initWithTitle:@"Warning" message:@"Wrong password!" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:NULL, nil];
            }
        
    
       
    
    
   
    
    for(int i=1;i<(allusers).count;i++){
        if([[[allusers objectAtIndex:i] login] isEqualToString: log]){
            
            if([[[allusers objectAtIndex:i]password]isEqualToString:password]){
                
                
                
                self.login=[usernameField text];
                [tempView setLogin:self.login];
                NSLog(@"%@",self.login);
                NSLog(@"%@",[tempView login]);
               
                [tempView release];
               
                [self performSegueWithIdentifier:@"tomain" sender:self];
                 
                
                            
                break;
                
            
            } else{
                alert=[[UIAlertView alloc]initWithTitle:@"Warning" message:@"Wrong password!" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:NULL, nil];
                NSLog(@"wrong password!");
                break;
            }
            
            
            //[self performSegueWithIdentifier:@"tomainview" sender:self];
           // break;
            //NSLog(@"founded");
        } 
        //alert=[[UIAlertView alloc]initWithTitle:@"Warning" message:@"User not found! Please register!" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:NULL, nil];
        
    }
   
   
    
}

-(void)dealloc{
    [usernameField release];
    [userpasswordField release];
    [loginButton release];

    [login release];
}

-(NSString*)getLogin{
   //loginnn=[usernameField text];
    return login;
   

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    NSArray *usersinfo=[[UserDatabase database]getallusers];
    for(userinfo *info in usersinfo){
        NSLog(@"%d - %@ - %@",info.userid, info.login, info.password);
        
    }
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [usernameField resignFirstResponder];
    [userpasswordField resignFirstResponder];
    return YES;
}
-(BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    self.login=[usernameField text];
    return YES;
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    //[loginnn retain];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
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
