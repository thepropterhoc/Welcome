//
//  EmailViewController.m
//  Welcome
//
//  Created by Shelby Vanhooser on 3/14/15.
//  Copyright (c) 2015 Integrated Applications. All rights reserved.
//

#import "EmailViewController.h"

@interface EmailViewController ()
@property (strong, nonatomic) IBOutlet UITextField *emailField;

@end

@implementation EmailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)next:(id)sender
{
  [[Controller sharedInstance] setnewVisitorEmail:self.emailField.text];
  [self performSegueWithIdentifier:@"pushToCompany" sender:self];
}

- (IBAction)cancel:(id)sender
{
  [[Controller sharedInstance] clearNewVisitor];
  [self.navigationController popToRootViewControllerAnimated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
