//
//  IFNPageViewController.swift
//  Infinite-scroll-swift
//
//  Created by Anak Mirasing on 6/8/16.
//  Copyright © 2016 iGROOMGRiM. All rights reserved.
//

import UIKit

class IFNPageViewController: UIPageViewController {
    var controllers: [UIViewController]
    var currentIndex = 1
    
    init(frame: CGRect, viewControllers: [UIViewController]) {
        controllers = viewControllers
        super.init(transitionStyle: .Scroll, navigationOrientation: .Horizontal, options: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        dataSource = self
        guard let firstViewController = controllers.first else {
            return
        }
        
        setViewControllers([firstViewController], direction: .Forward, animated: true, completion: nil)
    }
}

extension IFNPageViewController: UIPageViewControllerDelegate {
    func pageViewController(pageViewController: UIPageViewController, willTransitionToViewControllers pendingViewControllers: [UIViewController]) {
        
    }
    
    func pageViewController(pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
    }
}

extension IFNPageViewController: UIPageViewControllerDataSource {
    func pageViewController(pageViewController: UIPageViewController,
                            viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        guard let index = controllers.indexOf(viewController) else {
            return nil
        }
        
        if index == 0 {
            return controllers[controllers.count-1]
        }
        
        let previousIndex = index - 1
        return controllers[previousIndex]
    }
    
    func pageViewController(pageViewController: UIPageViewController,
                            viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        guard let index = controllers.indexOf(viewController) else {
            return nil
        }

        let nextIndex = index + 1
        if nextIndex == controllers.count {
            return controllers.first
        }
        
        return controllers[nextIndex]
    }
}

