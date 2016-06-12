//
//  ViewController.swift
//  Infinite-scroll-swift
//
//  Created by Anak Mirasing on 5/10/16.
//  Copyright © 2016 iGROOMGRiM. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let exampleFrame = view.frame
        
        let vc1 = OneViewController()
        let vc2 = TwoViewController()
        let vc3 = ThreeViewController()
        
        let ifn = IFNPageViewController(frame: exampleFrame, viewControllers: [vc1, vc2, vc3])
        ifn.ifnDelegate = self
        
        // Add to your view
        addChildViewController(ifn)
        view.addSubview(ifn.view)
        ifn.didMoveToParentViewController(self)
    }
}

extension ViewController: IFNPageViewDelegate {
    func ifnPageViewCurrentIndex(currentIndex: Int) {
        print("currentIndex : \(currentIndex)")
    }
}
