//
//  RecordListViewController.h
//  Infinite-scroll
//
//  Created by Anak Mirasing on 7/25/2558 BE.
//  Copyright (c) 2558 iGROOMGRiM. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol FilterMenuDelegate <NSObject>

-(void)setCurrentFilterIndex:(NSUInteger)filterCurrentIndex;

@end

@interface RecordListViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, assign) NSInteger indexNumber; // view index number
@property (nonatomic, weak) IBOutlet UITableView *recordListTableView;
@property (nonatomic, strong) NSArray *filterArray;

@property (nonatomic, assign) id <FilterMenuDelegate>delegate;
@end
