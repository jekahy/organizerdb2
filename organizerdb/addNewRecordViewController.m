//
//  addNewRecordViewController.m
//  organizerdb
//
//  Created by Жека Г on 3/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "addNewRecordViewController.h"
#import "ViewController.h"
#import "userdatabase.h"
#import "viewController2.h"

@implementation addNewRecordViewController


@synthesize Picker,textView,textField,arrayForType,arrayForProjects,swit4,login,date,project,typee,addButton;
@synthesize record,duration;

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if(component==1){
        typee=[arrayForType objectAtIndex:row];
        NSLog(@"type %@",typee);
    } else{
        project=[arrayForProjects objectAtIndex:row];
        NSLog(@"project %@",project);
    }
    
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([[segue identifier]isEqualToString:@"fromAddToMain"]){
        viewController2 *tempView=[segue destinationViewController];
        [tempView setLogin:login];
        
        
    }
}



-(IBAction)addNewRecord:(id)sender{
    self.record=[textView text];
    NSLog(@"%@",record);
    [[UserDatabase database]addRecord:login date:date project:project type:typee duration:duration record:record];
    NSLog(@"date %@ type %@ project %@ record %@",date,typee,project,record);
    [self performSegueWithIdentifier:@"fromAddToMain" sender:self];
    
    
    //[UserDatabase database]addRecord:login date:date project:project  type:type record:<#(NSString *)#>
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
-(void)viewWillAppear:(BOOL)animated{
    self.project=@"Chupackabra";
    self.typee=@"Self development";
    [swit4 setHidden:YES];
    
    
}
- (void)viewDidLoad
{
    
    [super viewDidLoad];
    x=0;
    [swit4 setOn:NO];
   
    
    arrayForType=[[NSArray alloc]initWithObjects:@"Self development",@"Working time",@"Team time",@"Extra time", nil];
    arrayForProjects=[[NSArray alloc]initWithObjects:@"Chupackabra",@"Valkirye",@"Panther", nil];
    [swit4 addTarget:self action:@selector(moveUp:) forControlEvents:UIControlEventValueChanged];
    
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    self.arrayForType=nil;
    self.arrayForProjects=nil;
    swit4.on=NO;
}

-(void)dealloc{
    
    [arrayForType release];
    [arrayForProjects release];
    [super dealloc];
    
}
-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if(component==1) return [arrayForType objectAtIndex:row];
    return [arrayForProjects objectAtIndex:row];
    
}


-(NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 2;
}


-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if(component==1 ){
        return [arrayForType count];
    } else{
        return  [arrayForProjects count];
    }
    
    
}
-(IBAction) resignFirstResponder:(id)sender{
    [self resignFirstResponder];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(void)textDidBeginEditing:(UITextField*)textfield{
    
    [self animatedTextField:YES];
    
    
}
-(void)textDidEndEditing:(UITextField*)textfield{
    [self resignFirstResponder:self];
    [self animatedTextField:NO];
    
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    //[self resignFirstResponder];
    self.duration=[self.textField text];
    [self.textField resignFirstResponder];
    return YES;
    
}
-(void)animatedTextField:(BOOL)up{//:(UITextField*)textfield up:(BOOL)up{
    if(up){
    const int movementDistance=220;
    const float movementDuration=0.3f;
    int movement=(up ? -movementDistance: movementDuration );
    self.view.frame=CGRectOffset(self.view.frame, 0, movement);
    [UIView commitAnimations];
    } else{
        const int movementDistance=-220;
        const float movementDuration=0.3f;
        int movement=(YES ? -movementDistance: movementDuration );
        self.view.frame=CGRectOffset(self.view.frame, 0, movement);
        [UIView commitAnimations];
    }

}

-(BOOL)textViewShouldEndEditing:(UITextView *)textView{
    [self resignFirstResponder];
    return YES;
}
-(BOOL)textViewShouldBeginEditing:(UITextView *)textView{
    [self animatedTextField:YES]; 
    [swit4 setHidden:NO];
    [self.swit4 setOn:YES];
    [textField setHidden:YES];
    return YES;
}

-(IBAction)moveUp:(id)sender{
    
    /*if(x%2==0){
        [self animatedTextField:YES];
        
    } else {
        
        [self animatedTextField:NO];
    }
    x++;
     */
    if(swit4.on){
        [self animatedTextField:YES];  
        
        
    } else{
    //if(!swit4.on){
        [self animatedTextField:NO];
        NSLog(@"switch is off");
        [textView resignFirstResponder];
        [swit4 setHidden:YES];
        [textField setHidden:NO];
        
    }
}




@end
