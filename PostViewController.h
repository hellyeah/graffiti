//
//  PostViewController.h
//  graffiti
//
//  Created by David Fontenot on 5/26/13.
//  Copyright (c) 2013 David Fontenot. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface PostViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextView *friendText;
- (IBAction)postButtonTouchHandler:(id)sender;


@end
