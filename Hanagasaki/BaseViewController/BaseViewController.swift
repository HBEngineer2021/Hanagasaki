//
//  BaseViewController.swift
//  Hanagasaki
//
//  Created by Motoki Onayama on 2021/07/24.
//

import UIKit
import FMDB

protocol ArticleDataDelegate {
   func getAllArticleData()
}

class BaseViewController: UIViewController, ArticleDataDelegate {
    
    var hambugerMenuView = HambugerMenuView()
    
    let shadowView = UIView(frame: CGRect(x: 0, y: 0, width: 320, height: 568))
    
    let xibView = HambugerMenuView(frame: CGRect(x: 0, y: 0, width: 240, height: 568))
    
    let tabBarVC = UITabBarController()
    
    @IBOutlet weak var backGroundImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapShadowViewGestureRecognizer = UITapGestureRecognizer(target: self,
                                                                  action: #selector(tapCloseHambugerMenu))
        shadowView.addGestureRecognizer(tapShadowViewGestureRecognizer)
    }

    func addHeaderBar(_ headerTitle: String, _ headerLeftButton: UIBarButtonItem!, _ headerRightButton: UIBarButtonItem!) {
        var headerBar:HeaderBar
        headerBar = Bundle.main.loadNibNamed("Header", owner: self, options: nil)!.first! as! HeaderBar
        headerBar.title.title = headerTitle
        headerBar.title.leftBarButtonItem = headerLeftButton
        headerBar.title.rightBarButtonItem = headerRightButton
        self.view.addSubview(headerBar)
    }
    
    func moveSetHambugerMenu() {
        tabBarController?.tabBar.isHidden = true
        shadowView.backgroundColor = UIColor.black.withAlphaComponent(0.15)
        shadowView.isOpaque = false
        shadowView.isHidden = false
        view.addSubview(shadowView)
        xibView.backgroundColor = .white
        xibView.hambugerMenuTable.backgroundColor = .white
        xibView.isHidden = false
        view.addSubview(xibView)
    }
    
    func closeSetHambugerMenu() {
        shadowView.isHidden = true
        xibView.isHidden = true
        tabBarController?.tabBar.isHidden = false
    }
    
    func getAllArticleData() {
       _ = ModelManager.getInstance().getAllArticle()
    }
    
    @objc func tapped(){
        
        let vc1 = ProfileViewController()
        let vc2 = ArticleViewController()
        let vc3 = VideoViewController()
        let vc4 = QiitaViewController()
        let vc5 = BusinessCardViewController()
        
        tabBarVC.setViewControllers([vc1, vc2, vc3, vc4, vc5], animated: false)
        tabBarVC.modalPresentationStyle = .fullScreen
        present(tabBarVC, animated: true)
    }

    @objc func tapHambugerMenu() {
        moveSetHambugerMenu()
    }
    
    @objc func tapCloseHambugerMenu() {
        closeSetHambugerMenu()
    }
    
    @objc func tapAddArticle() {
       let storyboard = UIStoryboard(name: "ArticleEntry", bundle: nil)
        let ArticleEntryViewController = storyboard.instantiateViewController(withIdentifier: "ArticleEntryViewController")
        present(ArticleEntryViewController, animated: true, completion: nil)
        //ArticleEntryViewController.articleDataDelegate = self
        self.navigationController?.pushViewController(ArticleEntryViewController, animated: true)
    }
    
    @objc func tapAddVideo() {
        let storyboard = UIStoryboard(name: "VideoEntry", bundle: nil)
        let VideoEntryViewController = storyboard.instantiateViewController(withIdentifier: "VideoEntryViewController")
        present(VideoEntryViewController, animated: true, completion: nil)
    }
    
    @objc func tapQiitaIcon() {
        let url = URL(string: "https://qiita.com/")
        if UIApplication.shared.canOpenURL(url!) {
            UIApplication.shared.open(url!)
        }
    }
    
}

extension UIColor {
    /// 16進カラーコードでカラーを生成
    ///
    /// - Parameters:
    ///   - hex: 16進カラーコード
    ///   - alpha: アルファ値
    convenience init(hex: UInt, alpha: CGFloat = 1.0) {
        let red: CGFloat = CGFloat((hex & 0xFF0000) >> 16) / 255.0
        let green: CGFloat = CGFloat((hex & 0x00FF00) >> 8) / 255.0
        let blue: CGFloat = CGFloat(hex & 0x0000FF) / 255.0
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}
