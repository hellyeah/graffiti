//
//  LoginViewController.m
//  graffiti
//
//  Created by David Fontenot on 5/20/13.
//  Copyright (c) 2013 David Fontenot. All rights reserved.
//

#import "LoginViewController.h"
#import "AppDelegate.h"

@interface LoginViewController ()

@end

@implementation LoginViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    PFObject *testObject = [PFObject objectWithClassName:@"TestObject"];
    [testObject setObject:@"bar" forKey:@"foo"];
    [testObject saveInBackground];
    [super viewDidLoad];
	// Do any additional setup after loading the view.

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
- (IBAction)authButtonAction:(UIButton *)sender {
    NSLog(@"authButtonAction pressed");
    
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    // The person using the app has initiated a login, so call the openSession method
    // and show the login UX if necessary.
    [appDelegate openSessionWithAllowLoginUI:YES];
}
*/

- (IBAction)loginButtonTouchHandler:(id)sender  {
    
    // The permissions requested from the user
    
    NSArray *permissionsArray = @[ @"user_about_me", @"user_relationships", @"user_birthday", @"user_location", @"email"];
    
    // Login PFUser using Facebook
    
    [PFFacebookUtils logInWithPermissions:permissionsArray block:^(PFUser *user, NSError *error) {
        //[_activityIndicator stopAnimating]; // Hide loading indicator
        NSLog(@"success");
        if (!user) {
            if (!error) {
                NSLog(@"Uh oh. The user cancelled the Facebook login.");
            } else {
                NSLog(@"Uh oh. An error occurred: %@", error);
            }
        } else if (user.isNew) {
            NSLog(@"User with facebook signed up and logged in!");
            [self performSegueWithIdentifier: @"afterLogin" sender: self];
        } else {
            NSLog(@"User with facebook logged in!");
            [self performSegueWithIdentifier: @"afterLogin" sender: self];
        }
    }];
     
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"afterLogin"])
        {
            //NewViewController *vc = [segue destinationViewController];
            //vc.dataThatINeedFromTheFirstViewController = self.theDataINeedToPass;
        }
}



@end
