//
//  addNewRecordViewController.h
//  organizerdb
//
//  Created by Жека Г on 3/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface addNewRecordViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource,UITextViewDelegate,UITextFieldDelegate>{
     UIButton *addButton;
     UITextField *textField;
     UIPickerView *Picker;
    int x;
     UITextView *textView;
    NSArray *arrayForType;
    UISwitch *swit4;
    NSString *login;
    NSString *date;
    NSString *project;
    NSString *typee;
    NSString *record;
    NSString *duration;
}
@property(nonatomic,retain)NSString *record;
@property(nonatomic,retain)NSString *duration;
@property(nonatomic,retain)IBOutlet UIButton *addButton;
@property(nonatomic,retain)IBOutlet UITextField *textField;
@property(nonatomic,retain)IBOutlet UIPickerView *Picker;
@property(nonatomic,retain)IBOutlet UISwitch *swit4;
@property(nonatomic,retain)IBOutlet UITextView *textView;
@property(nonatomic,retain)NSArray *arrayForType;
@property(nonatomic,retain)NSArray *arrayForProjects;
@property(nonatomic,retain)NSString *login;
@property(nonatomic,retain)NSString *date;
@property(nonatomic,retain)NSString *project;
@property(nonatomic,retain)NSString *typee;

-(IBAction)addNewRecord:(id)sender;
-(IBAction)textDidBeginEditing:(UITextField*)textfield;
-(IBAction)textDidEndEditing:(UITextField*)textfield;
-(void)animatedTextField:(BOOL)up;
-(IBAction) resignFirstResponder:(id)sender;
-(IBAction)moveUp:(id)sender;
@end
