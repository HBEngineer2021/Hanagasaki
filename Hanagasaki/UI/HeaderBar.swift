//
//  HeaderBar.swift
//  Hanagasaki
//
//  Created by Motoki Onayama on 2021/07/30.
//

import UIKit

class HeaderBar: UINavigationBar {
    @IBOutlet weak var title: UINavigationItem!
    var hambugerMenuBar: UINavigationItem?
    @IBOutlet weak var leftBarButton: UIBarButtonItem!
    @IBOutlet weak var rightBarButton: UIBarButtonItem!
    
    override func draw(_ rect: CGRect) {
            let selfheight:CGFloat = 44
            let selfwidth:CGFloat = 320
            self.frame.size.height = selfheight
            self.frame.size.width = selfwidth

            self.frame.origin.x = 0
            self.frame.origin.y = 24
        
    }
    
}
