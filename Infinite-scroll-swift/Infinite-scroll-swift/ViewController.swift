//
//  ViewController.swift
//  Infinite-scroll-swift
//
//  Created by Anak Mirasing on 5/10/16.
//  Copyright © 2016 iGROOMGRiM. All rights reserved.
//

import UIKit
import IGGInfinitePageViewController

class ViewController: UIViewController {
    @IBOutlet weak var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let exampleFrame = view.frame
        
        let vc1 = OneViewController()
        let vc2 = TwoViewController()
        let vc3 = ThreeViewController()
        
        let ifnPageScroll = IGGInfinitePageViewController(frame: exampleFrame, viewControllers: [vc1, vc2, vc3])
        ifnPageScroll.infiniteDelegate = self
        
        // Add to your view
        addChildViewController(ifnPageScroll)
        view.addSubview(ifnPageScroll.view)
        ifnPageScroll.didMove(toParentViewController: self)
        
        pageControl.numberOfPages = 3
        view.bringSubview(toFront: pageControl)
    }
}

extension ViewController: IGGInfinitePageViewDelegate {
    func pageViewCurrentIndex(_ currentIndex: Int) {
        print("currentIndex : \(currentIndex)")
        pageControl.currentPage = currentIndex
    }
}
