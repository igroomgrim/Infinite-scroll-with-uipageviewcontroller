//
//  PageViewContainerViewController.m
//  Infinite-scroll
//
//  Created by Anak Mirasing on 7/25/2558 BE.
//  Copyright (c) 2558 iGROOMGRiM. All rights reserved.
//

#import "PageViewContainerViewController.h"

@interface PageViewContainerViewController ()

@end

@implementation PageViewContainerViewController

@synthesize pagerView,viewBoard,statusLabel;
@synthesize viewsArray,filterArray;
@synthesize oldOffset,activeMenuIndex,oldMenuIndex,currentIndex;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self pageViewSetup];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - PageView Settup
- (void)pageViewSetup {
    
    activeMenuIndex = 1;
    oldMenuIndex = 1;
    currentIndex = 1;
    oldOffset = CGPointZero;
    filterArray = [NSArray arrayWithObjects:@"Success",@"All",@"Waiting",@"Cancel", nil];
    [self setHeaderStatus:[filterArray objectAtIndex:1]];
    
    pagerView = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    pagerView.dataSource = self;
    pagerView.delegate = self;
    pagerView.view.backgroundColor = [UIColor clearColor];
    [pagerView.view setFrame:CGRectMake(0, 0, viewBoard.frame.size.width, viewBoard.frame.size.height)];
    
    RecordListViewController *vcObject = [self viewControllerAtIndex:1];
    viewsArray = [[NSMutableArray alloc] initWithArray:[NSArray arrayWithObject:vcObject]];
    [pagerView setViewControllers:viewsArray direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    [self addChildViewController:pagerView];
    [viewBoard addSubview:pagerView.view];
    [pagerView didMoveToParentViewController:self];
}

-(void)setHeaderStatus:(NSString *)status {
    statusLabel.text = [NSString stringWithFormat:@"Infinite-%@",status];
}

-(RecordListViewController *)viewControllerAtIndex:(NSUInteger)index {
    
    UIStoryboard *mainStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    RecordListViewController *childVC = [mainStoryBoard instantiateViewControllerWithIdentifier:@"RecordListViewController"];
    childVC.delegate = self;
    childVC.indexNumber = index;
    
    return childVC;
}

#pragma mark - Filter Menu Delegate
-(void)setCurrentFilterIndex:(NSUInteger)filterCurrentIndex {
    currentIndex = filterCurrentIndex;
    [self setHeaderStatus:[filterArray objectAtIndex:currentIndex]];
}

#pragma mark - PageView Datasource
-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    
    NSUInteger index = [(RecordListViewController *)viewController indexNumber];
    
    if (index == 0) {
        
        return [self viewControllerAtIndex:filterArray.count-1];
    }
    index--;
    return [self viewControllerAtIndex:index];
}

-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    
    NSUInteger index = [(RecordListViewController *)viewController indexNumber];
    index++;
    if (index == filterArray.count) {
        return [self viewControllerAtIndex:0];;
    }
    return [self viewControllerAtIndex:index];
}

#pragma mark - PageView Delegate
-(void)pageViewScroll:(NSUInteger)index andDirection:(UIPageViewControllerNavigationDirection)direction andAnimate:(BOOL)anim {
    RecordListViewController *vcObject = [self viewControllerAtIndex:index];
    viewsArray = [[NSMutableArray alloc] initWithArray:[NSArray arrayWithObject:vcObject]];
    [pagerView setViewControllers:viewsArray direction:direction animated:anim completion:nil];
}


@end
