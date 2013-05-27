//
//  MainStreamViewController.h
//  graffiti
//
//  Created by David Fontenot on 5/23/13.
//  Copyright (c) 2013 David Fontenot. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface MainStreamViewController : UIViewController <UITableViewDataSource, UITableViewDelegate> {
    IBOutlet UINavigationBar *navBar;
    IBOutlet UITableView *_tableView;
}

//@property (nonatomic, retain) UINavigationBar *navBar;
//@property (nonatomic, retain) UITableView *tableView;
//@property (strong, nonatomic) IBOutlet UITableView *tableView;
//@property (strong, nonatomic) MainStreamTableViewController *tableViewController;
@property (nonatomic, strong) NSMutableArray *posts;

@end




