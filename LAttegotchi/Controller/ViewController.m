//
//  ViewController.m
//  LAttegotchi
//
//  Created by Alex Jahl on 17.02.14.
//  Copyright (c) 2014 Alex Jahl. All rights reserved.
//

#import "ViewController.h"

#import "TableViewController.h"
#import "AppDelegate.h"
#import "LAttegotchi.h"
#import "DotImageView.h"

@interface ViewController ()

@end

@implementation ViewController


- (id)init
{
    self = [super init];
    if (self) {

    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    UITableView *tv =  self.tableView;
    tableViewController = [[TableViewController alloc] init];
    [self addChildViewController:tableViewController];
    
    tv.dataSource = tableViewController;
    tv.delegate = tableViewController;
    tableViewController.view = tv;
    tableViewController.tableView = tv;
    
    tableViewController.data = [[self getLAtte] wishes];
    [(UITableView*)[tableViewController view] reloadData];
    
    DotImageView * dotView = [[DotImageView alloc] initWithFrame:[_imageView frame]];
    [_imageView addSubview:dotView];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(LAttegotchi *) getLAtte {
    AppDelegate * app = [[UIApplication sharedApplication]delegate];
    LAttegotchi * latte  = [[[app getPlayer] lattegotchies ] objectAtIndex:0];
    return latte;
}

- (IBAction)menueSelector:(id)sender{
    UISegmentedControl *segmentedControl = (UISegmentedControl *) sender;
    NSInteger selectedSegment = segmentedControl.selectedSegmentIndex;
    AppDelegate * app = [[UIApplication sharedApplication]delegate];
    LAttegotchi * latte  = [self getLAtte];
    switch (selectedSegment) {
        case 0:
            //Whish
        {
            
            tableViewController.data = [latte wishes];
            tableViewController.currentTableView = 0;

            break;
        }
        case 1:
            //Backpack
        {
            
            tableViewController.data = [[app getPlayer] items];
            tableViewController.currentTableView = 1;
            
            break;
        }
        case 2:
            //Store
            
        {
            tableViewController.data = [[app getPlayer] items];
            tableViewController.currentTableView = 2;
            
            break;
        }
        default:
            // bloed
            break;
    }
    
    UITableView * t = (UITableView*)[tableViewController view];
    [t reloadData];
    
}

@end
