//
//  TabBarController.swift
//  Hanagasaki
//
//  Created by Motoki Onayama on 2021/07/24.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        for vc in self.viewControllers! {
                    _ = vc.view
        }
    }
}
