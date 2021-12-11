//
//  ProfileViewController.swift
//  Hanagasaki
//
//  Created by Motoki Onayama on 2021/07/24.
//

import UIKit

class ProfileViewController: BaseViewController {
    
    @IBOutlet weak var profileImage: UIImageView! {
        didSet {
            profileImage.layer.cornerRadius = 90
        }
    }
    
    let cornerRadius = 10
    
    @IBOutlet weak var nameView: UIView! {
        didSet {
            nameView.layer.shadowColor = UIColor.black.cgColor //影の色を決める
            nameView.layer.shadowOpacity = 1 //影の色の透明度
            nameView.layer.shadowRadius = 8 //影のぼかし
            nameView.layer.shadowOffset = CGSize(width: 4, height: 4) //影の方向　width、heightを負の値にすると上の方に影が表示される
        }
    }
    
    @IBOutlet weak var langageView: UIView! {
        didSet {
            langageView.layer.shadowColor = UIColor.black.cgColor //影の色を決める
            langageView.layer.shadowOpacity = 1 //影の色の透明度
            langageView.layer.shadowRadius = 8 //影のぼかし
            langageView.layer.shadowOffset = CGSize(width: 4, height: 4) //影の方向　width、heightを負の値にすると上の方に影が表示される
        }
    }
    
    @IBOutlet weak var majorView: UIView! {
        didSet {
            majorView.layer.shadowColor = UIColor.black.cgColor //影の色を決める
            majorView.layer.shadowOpacity = 1 //影の色の透明度
            majorView.layer.shadowRadius = 8 //影のぼかし
            majorView.layer.shadowOffset = CGSize(width: 4, height: 4) //影の方向　width、heightを負の値にすると上の方に影が表示される
        }
    }
    
    @IBOutlet weak var nameList: UILabel! {
        didSet {
            nameList.layer.cornerRadius = CGFloat(cornerRadius)
            nameList.clipsToBounds = true
        }
    }
    @IBOutlet weak var langageList: UILabel! {
        didSet {
            langageList.layer.cornerRadius = CGFloat(cornerRadius)
            langageList.clipsToBounds = true
        }
    }
    @IBOutlet weak var majorList: UILabel! {
        didSet {
            majorList.layer.cornerRadius = CGFloat(cornerRadius)
            majorList.clipsToBounds = true
        }
    }
    @IBOutlet weak var nameLabel: UILabel! {
        didSet {
            nameLabel.layer.cornerRadius = CGFloat(cornerRadius)
            nameLabel.clipsToBounds = true
        }
    }
    @IBOutlet weak var langageLabel: UILabel! {
        didSet {
            langageLabel.layer.cornerRadius = CGFloat(cornerRadius)
            langageLabel.clipsToBounds = true
        }
    }
    @IBOutlet weak var majorLabel: UILabel! {
        didSet {
            majorLabel.layer.cornerRadius = CGFloat(cornerRadius)
            majorLabel.clipsToBounds = true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addHeaderBar("Profile",
                     UIBarButtonItem(image: #imageLiteral(resourceName: "bars_24"), style: .done, target: self, action: #selector(tapHambugerMenu)),
                     nil)
        //self.view.addSubview(hambugerMenuView)
    }
    
    @IBAction func tapProfileImage(_ sender: UITapGestureRecognizer) {
        let url = URL(string: "https://buntyan-ittech.hatenablog.com/")
        if UIApplication.shared.canOpenURL(url!) {
            UIApplication.shared.open(url!)
        }
    }
    
    
}
