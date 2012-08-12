//
//  CHLIViewController.h
//  Changing Lives
//
//  Created by Kai Oelfke on 14.07.12.
//  Copyright (c) 2012 Kai Oelfke. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CHLIViewController : UIViewController <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *wView;
@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
- (IBAction)pushLogin:(id)sender;

@end
