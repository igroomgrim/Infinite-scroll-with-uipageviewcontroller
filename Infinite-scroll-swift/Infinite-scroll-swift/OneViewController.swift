//
//  SampleViewController.swift
//  Infinite-scroll-swift
//
//  Created by Anak Mirasing on 6/8/16.
//  Copyright © 2016 iGROOMGRiM. All rights reserved.
//

import UIKit

class OneViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.redColor()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        print("OneViewController : DidAppear")
    }
}
