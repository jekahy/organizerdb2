//
//  viewController2.h
//  organizerdb
//
//  Created by Жека Г on 3/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface viewController2 : UIViewController{
    UIImageView *image;
     UINavigationItem *navItem;
     UILabel *label;
     UIDatePicker *datePicker;
     UIButton *showDate;
    NSString *login;
    NSString *date;
    UIButton *showButton;
    NSArray *records;
    
}
-(void)changeNavItemTitle:(NSString*)title;
-(IBAction)pickerChanged:(id)sender;
-(IBAction)add:(id)sender;
-(IBAction)show;

@property(nonatomic,retain)NSString *login;
@property(nonatomic,retain)NSString *date;
@property(nonatomic,retain)IBOutlet UILabel *label;
@property(nonatomic,retain)IBOutlet UIImageView *image;
@property(nonatomic,retain)IBOutlet UINavigationItem *navItem;
@property(nonatomic,retain)IBOutlet UIDatePicker *datePicker;
@property(nonatomic,retain)IBOutlet UIButton *showDate;
@property(nonatomic,retain)IBOutlet UIButton *showButton;
@property(nonatomic,retain)NSArray *records;


@end
