//
//  FriendPickerViewController.h
//  graffiti
//
//  Created by David Fontenot on 5/27/13.
//  Copyright (c) 2013 David Fontenot. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import <SDWebImage/UIImageView+WebCache.h>

@interface FriendPickerViewController : UIViewController <UITableViewDataSource,
UITableViewDelegate> {
    IBOutlet UITableView *_tableView;
    IBOutlet UISearchBar *searchBar;
}

@property (nonatomic, strong) NSMutableArray *friends;

@end
