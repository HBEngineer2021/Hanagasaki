//
//  HambugerMenuView.swift
//  Hanagasaki
//
//  Created by Motoki Onayama on 2021/08/07.
//

import UIKit

class HambugerMenuView: UIView, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var hambugerMenuTable: UITableView! {
        didSet {
            hambugerMenuTable.rowHeight = UITableView.automaticDimension
        }
    }
    
    @IBOutlet weak var menuLabel: UILabel!
    
    @IBOutlet weak var osList: UILabel! {
        didSet {
            osList.textColor = .black
        }
    }
    
    @IBOutlet weak var osLabel: UILabel! {
        didSet {
            let osVerInput = UIDevice.current.systemVersion
            osLabel.text = "ver " + osVerInput
            osLabel.textColor = .black
        }
    }
    
    @IBOutlet weak var appList: UILabel! {
        didSet {
            appList.textColor  = .black
        }
    }
    
    @IBOutlet weak var appLabel: UILabel! {
        didSet {
            let version: String! = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String
            appLabel.text =  "ver " + version
            appLabel.textColor = .black
        }
    }
    
    var menuListArray =
            [Menu(list: "Documentation(Swift)", url: "https://swift.org/documentation/#the-swift-programming-language"),
             Menu(list: "Qiita", url: "https://qiita.com/"),
             Menu(list: "Zenn", url: "https://zenn.dev/"),
             Menu(list: "note", url: "note://"),
             Menu(list: "OpenCV", url: "http://labs.eecs.tottori-u.ac.jp/sd/Member/oyamada/OpenCV/html/py_tutorials/py_tutorials.html"),
             Menu(list: "DXライブラリ", url: "https://dxlib.xsrv.jp/"),
             Menu(list: "Github", url: "https://github.co.jp/"),
             Menu(list: "GitLab", url: "https://gitlab.com/users/sign_in?__cf_chl_jschl_tk__=pmd_ca11442f89ffb50102868e3e64d13db8ebf03033-1628360577-0-gqNtZGzNAiKjcnBszQiO"),
             Menu(list: "Bitbucket", url: "https://bitbucket.org/"),
             Menu(list: "stackoverflow", url: "https://stackoverflow.com/")]
    
    override init(frame: CGRect) {
            super.init(frame: frame)
            loadNib()
        hambugerMenuTable.delegate = self
        hambugerMenuTable.dataSource = self

        let customCell = UINib(nibName: "HambugerMenuCell", bundle: nil)
        hambugerMenuTable.register(customCell, forCellReuseIdentifier: "HambugerMenuCell")
        }
        
        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            loadNib()
            //fatalErrorがデフォルトで入っていますが消さないとエラーになってしまうので注意してください！
        }
        func loadNib() {
            //CustomViewの部分は各自作成したXibの名前に書き換えてください
            let view = Bundle.main.loadNibNamed("HambugerMenuView", owner: self, options: nil)?.first as! UIView
            view.frame = self.bounds
            view.backgroundColor = .white
            hambugerMenuTable.backgroundColor = .white
            self.addSubview(view)
        }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuListArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let url = URL(string: menuListArray[indexPath.row].url)
        if UIApplication.shared.canOpenURL(url!) {
            UIApplication.shared.open(url!)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = hambugerMenuTable.dequeueReusableCell(withIdentifier: "HambugerMenuCell", for: indexPath) as! HambugerMenuCell
        cell.menuList.text = menuListArray[indexPath.row].list
        return cell
    }
    
}

    
   
