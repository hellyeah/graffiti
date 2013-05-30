//
//  PostViewController.m
//  graffiti
//
//  Created by David Fontenot on 5/26/13.
//  Copyright (c) 2013 David Fontenot. All rights reserved.
//

#import "PostViewController.h"
#import <QuartzCore/QuartzCore.h>


@interface PostViewController ()

@end

@implementation PostViewController

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
    [super viewDidLoad];
    //Adding frame to textField
    [self.friendText.layer setBorderColor:[[[UIColor grayColor] colorWithAlphaComponent:0.5] CGColor]];
    [self.friendText.layer setBorderWidth:2.0];
    
	// Do any additional setup after loading the view.
    NSUserDefaults *userInfo = [NSUserDefaults standardUserDefaults];
    
    //problem is here
    NSString *postedAboutID = [[userInfo objectForKey:@"selectedFriend"] objectAtIndex:0];
    
    NSString *myID = [[userInfo objectForKey:@"myData"] objectAtIndex:0];
    
    NSLog(@"%@", postedAboutID);
    NSLog(@"%@", myID);
 
    //Clears text field upon activation
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    NSOperationQueue *mainQueue = [NSOperationQueue mainQueue];
    [center addObserverForName:UITextViewTextDidBeginEditingNotification object:nil
                                                     queue:mainQueue usingBlock:^(NSNotification *note) {
                                                         self.friendText.text = @"";
                                                     }
     ];
    
}

- (IBAction)postButtonTouchHandler:(id)sender {
    //NSString *myID = @"629564354";
    //NSString *postedAboutID = self.facebookID.text;
    NSString *friendText = self.friendText.text;
    
    NSUserDefaults *userInfo = [NSUserDefaults standardUserDefaults];
    NSString *postedAboutID = [[userInfo objectForKey:@"selectedFriend"] objectAtIndex:0];
    NSString *myID = [[userInfo objectForKey:@"myData"] objectAtIndex:0];
    
    NSLog(@"%@", postedAboutID);
    NSLog(@"%@", myID);
    
    PFObject *gameScore = [PFObject objectWithClassName:@"Post"];
    [gameScore setObject:postedAboutID forKey:@"postedAboutID"];
    [gameScore setObject:friendText forKey:@"text"];
    [gameScore setObject:myID forKey:@"postedFromID"];
    [gameScore saveInBackground];
    [self performSegueWithIdentifier:@"afterPost" sender:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
