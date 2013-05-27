//
//  TableViewController.h
//  graffiti
//
//  Created by David Fontenot on 5/20/13.
//  Copyright (c) 2013 David Fontenot. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface MainStreamTableViewController : UITableViewController

@property (nonatomic, strong) NSMutableArray *posts;

@end
