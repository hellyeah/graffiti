//
//  FriendPickerViewController.m
//  graffiti
//
//  Created by David Fontenot on 5/27/13.
//  Copyright (c) 2013 David Fontenot. All rights reserved.
//

#import "FriendPickerViewController.h"

@interface FriendPickerViewController ()

@end

@implementation FriendPickerViewController

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
    NSUserDefaults *userInfo = [NSUserDefaults standardUserDefaults];
    NSMutableArray *friendData = [userInfo objectForKey:@"friendData"];
    int i = 0;
    
    self.friends = [friendData mutableCopy];
    
    for (NSDictionary *friend in friendData) {
        //[self.friends insertObject:friendData atIndex:i];
        if(i < 10){
            //NSLog(@"%@", [[self.friends objectAtIndex:i] objectForKey:@"id"]);
            //NSLog(@"%@", [friend objectForKey:@"id"]);
        }
        i++;
    }
    [self->_tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [self.friends count];
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    NSMutableArray *friend = [self.friends objectAtIndex:indexPath.row];
    NSString *MyURL = [NSString stringWithFormat:@"http://graph.facebook.com/%@/picture?type=square", [friend objectAtIndex:0]];
    UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:MyURL]]];

    
    NSString *blah = [friend objectAtIndex:1];
    // Set up the cell...
    //cell.textLabel.font = [UIFont fontWithName:@"Helvetica" size:15];
    [cell.imageView setImage:image];
    [cell.imageView setImageWithURL:[NSURL URLWithString:MyURL] placeholderImage:[UIImage imageNamed:@"loading.png"]];
    cell.textLabel.text = blah;
    //cell.textLabel.text = [[self.friends objectAtIndex:indexPath.row] objectForKey:@"name"];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	// open a alert with an OK and cancel button
	NSString *alertString = [NSString stringWithFormat:@"Clicked on row #%d", [indexPath row]];
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:alertString message:@"" delegate:self cancelButtonTitle:@"Done" otherButtonTitles:nil];
	[alert show];
}

@end
