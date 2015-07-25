//
//  RecordListViewController.m
//  Infinite-scroll
//
//  Created by Anak Mirasing on 7/25/2558 BE.
//  Copyright (c) 2558 iGROOMGRiM. All rights reserved.
//

#import "RecordListViewController.h"

@interface RecordListViewController ()

@end

@implementation RecordListViewController

@synthesize recordListTableView;
@synthesize indexNumber;
@synthesize filterArray;
@synthesize delegate;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    filterArray = [NSArray arrayWithObjects:@"Success",@"All",@"Waiting",@"Cancel", nil];
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    NSLog(@"Table Filter Status : %@",[filterArray objectAtIndex:indexNumber]);
    [delegate setCurrentFilterIndex:indexNumber];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TableView Delegate & Datasource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 16;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *identifier = @"";
    
    switch (indexNumber) {
        case 0:
            identifier = @"SuccessCell";
            break;
        case 1: {
            NSUInteger r = arc4random_uniform(3);
            if (r==0) {
                identifier = @"SuccessCell";
            }else if(r==1) {
                identifier = @"WaitingCell";
            }else if(r==2) {
                identifier = @"CancelCell";
            }
        }
            break;
        case 2:
            identifier = @"WaitingCell";
            break;
        case 3:
            identifier = @"CancelCell";
            break;
        default:
            break;
    }
    
    UITableViewCell *recordCell = [tableView dequeueReusableCellWithIdentifier:identifier];
    return recordCell;
}


@end
