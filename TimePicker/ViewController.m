//
//  ViewController.m
//  TimePicker
//
//  Created by ihub on 04/12/18.
//  Copyright © 2018 ecoihub. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize button;

- (void)viewDidLoad {
    [super viewDidLoad];
    
//   self.timeTxtFld.clearsOnBeginEditing = NO;
    
   button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"Show" forState:UIControlStateNormal];
    [button.titleLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:13.0]];
    [button setTitleColor:[UIColor colorWithRed:36/255.0 green:71/255.0 blue:113/255.0 alpha:1.0] forState:UIControlStateNormal];
    button.imageEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
    
    button.frame = CGRectMake(self.timeTxtFld.frame.size.width - 20, self.timeTxtFld.frame.size.width - 20, 40, 40);
    [button addTarget:self action:@selector(togglePasswordReveal:) forControlEvents:UIControlEventTouchUpInside];
    self.timeTxtFld.rightView = button;
    self.timeTxtFld.rightViewMode = UITextFieldViewModeAlways;
    
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    NSString *updatedString = [self.timeTxtFld.text stringByReplacingCharactersInRange:range withString:string];
    
    self.timeTxtFld.text = updatedString;
    
    return NO;
}

- (IBAction)togglePasswordReveal:(id)sender
{
    if ([button.titleLabel.text isEqualToString:@"Show"]) {
        self.timeTxtFld.secureTextEntry = NO;
        [button setTitle:@"Hide" forState:UIControlStateNormal];
    }
    else {
        self.timeTxtFld.secureTextEntry = YES;
        [button setTitle:@"Show" forState:UIControlStateNormal];
    }
}


@end
