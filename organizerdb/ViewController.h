//
//  ViewController.h
//  organizerdb
//
//  Created by Жека Г on 3/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "viewController2.h"

@interface ViewController : UIViewController<UITextFieldDelegate>{
    
   
     UITextField *userpasswordField;
     UITextField *usernameField;
     UIButton *loginButton;   
    
    NSString *login;
}
@property (nonatomic, retain)IBOutlet UITextField *userpasswordField;
@property (nonatomic, retain)IBOutlet UITextField *usernameField;
@property (nonatomic, retain)IBOutlet UIButton *loginButton;

@property (nonatomic,retain)NSString *login;






    
-(IBAction) login: (id) sender;

-(NSString*)getLogin;


@end
