//
//  PostViewController.m
//  graffiti
//
//  Created by David Fontenot on 5/26/13.
//  Copyright (c) 2013 David Fontenot. All rights reserved.
//

#import "PostViewController.h"

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
	// Do any additional setup after loading the view.
}

- (IBAction)postButtonTouchHandler:(id)sender {
    NSString *myID = @"629564354";
    NSString *postedAboutID = self.facebookID.text;
    NSString *friendText = self.friendText.text;
    
    PFObject *gameScore = [PFObject objectWithClassName:@"Post"];
    [gameScore setObject:postedAboutID forKey:@"postedAboutID"];
    [gameScore setObject:friendText forKey:@"text"];
    [gameScore setObject:myID forKey:@"postedFromID"];
    [gameScore saveInBackground];
 
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)postButton:(id)sender {
}
@end
