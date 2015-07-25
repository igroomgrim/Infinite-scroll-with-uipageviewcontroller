# Infinite Scroll with custom UIPageViewController
Simply example how to implement Infinite Scroll with UIPageViewController.
In this project i show example in real world try to combine with UITableView and use swipe(scroll) left or right for filter data on tableview row.
This project include delegate function for help let you know what is current filter on tableview.

## Explain Function & Delegate
```objective-c
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
```

## Contact

Anak Mirasing

- https://github.com/igroomgrim
- https://twitter.com/igroomgrim
- http://www.igroomgrim.com/
- thaihooligan@hotmail.com
