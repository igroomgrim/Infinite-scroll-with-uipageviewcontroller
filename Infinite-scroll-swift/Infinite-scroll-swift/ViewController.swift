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
        let ff = self.view.frame
        
        let vc1 = OneViewController()
        let vc2 = TwoViewController()
        let vc3 = ThreeViewController()
        
        let ifn = IFNPageViewController(frame: ff, viewControllers: [vc1, vc2, vc3])
        addChildViewController(ifn)
        view.addSubview(ifn.view)
        ifn.didMoveToParentViewController(self)
    }
}
