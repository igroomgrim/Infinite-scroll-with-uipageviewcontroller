//
//  IGGInfinitePageViewController.swift
//  IGGInfinitePageViewController
//
//  Created by Anak Mirasing on 6/12/2559 BE.
//  Copyright © 2559 iGROOMGRiM. All rights reserved.
//

import UIKit

public protocol IGGInfinitePageViewDelegate: class {
    func pageViewCurrentIndex(_ currentIndex: Int)
}

open class IGGInfinitePageViewController: UIPageViewController {
    fileprivate var controllers: [UIViewController]
    open weak var infiniteDelegate: IGGInfinitePageViewDelegate?
    
    public init(frame: CGRect, viewControllers: [UIViewController]) {
        controllers = viewControllers
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = self
        guard let firstViewController = controllers.first else {
            return
        }
        
        setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
    }
}

extension IGGInfinitePageViewController: UIPageViewControllerDataSource {
    public func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = controllers.index(of: viewController) else {
            return nil
        }
        
        infiniteDelegate?.pageViewCurrentIndex(index)
        
        if index == 0 {
            return controllers[controllers.count-1]
        }
        
        let previousIndex = index - 1
        return controllers[previousIndex]
    }
    
    public func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = controllers.index(of: viewController) else {
            return nil
        }
        
        infiniteDelegate?.pageViewCurrentIndex(index)
        
        let nextIndex = index + 1
        if nextIndex == controllers.count {
            
            return controllers.first
        }
        
        return controllers[nextIndex]
    }
}
