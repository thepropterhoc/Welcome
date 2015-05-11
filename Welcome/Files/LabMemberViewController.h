//
//  LabMemberViewController.h
//  Welcome
//
//  Created by Shelby Vanhooser on 12/19/14.
//  Copyright (c) 2014 Integrated Applications. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>

@interface LabMemberViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate, MFMessageComposeViewControllerDelegate>

@property BOOL returning;

@end
