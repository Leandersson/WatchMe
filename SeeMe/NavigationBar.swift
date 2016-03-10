//
//  NavigationBar.swift
//  SeeMe
//
//  Created by Leandersson, Johan (Grey London) on 17/02/2016.
//  Copyright © 2016 Leandersson, Johan (Grey London). All rights reserved.
//

import UIKit

class NavigationBar: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        self.navigationBar.shadowImage = UIImage()
        self.navigationBar.translucent = true
    }

    



}
