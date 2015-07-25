//
//  PageViewContainerViewController.h
//  Infinite-scroll
//
//  Created by Anak Mirasing on 7/25/2558 BE.
//  Copyright (c) 2558 iGROOMGRiM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RecordListViewController.h"

@interface PageViewContainerViewController : UIViewController<UIPageViewControllerDataSource,UIPageViewControllerDelegate,FilterMenuDelegate>
@property (nonatomic, weak) IBOutlet UIView *viewBoard;
@property (nonatomic, weak) IBOutlet UILabel *statusLabel;
@property (nonatomic, strong) UIPageViewController *pagerView;
@property (nonatomic, strong) NSArray *viewsArray;
@property (nonatomic, assign) NSUInteger activeMenuIndex;
@property (nonatomic, assign) NSUInteger oldMenuIndex;
@property (nonatomic, assign) NSUInteger currentIndex;
@property (nonatomic) CGPoint oldOffset;
@property (nonatomic, strong) NSArray *filterArray;
@end
