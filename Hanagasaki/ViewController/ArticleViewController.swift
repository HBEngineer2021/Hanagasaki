//
//  ArticleViewController.swift
//  Hanagasaki
//
//  Created by Motoki Onayama on 2021/07/24.
//

import UIKit

class ArticleViewController: BaseViewController {
    
    @IBOutlet weak var articleTableView: UITableView!
    
    var modelArray = [modelArticle]()
    
    var id: String?
    var articleTitle: String?
    var url: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        articleTableView.delegate = self
        articleTableView.dataSource = self
        addCustomCell()
        addHeaderBar("Article",
                     UIBarButtonItem(image: #imageLiteral(resourceName: "bars_24"), style: .done, target: self, action: #selector(tapHambugerMenu)),
                     UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(tapAddArticle)))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        modelArray = ModelManager.getInstance().getAllArticle()
        articleTableView.reloadData()
    }
    
    func addCustomCell() {
        let customCell = UINib(nibName: "ArticleCell", bundle: nil)
        articleTableView.register(customCell, forCellReuseIdentifier: "ArticleCell")
    }
    
}

extension ArticleViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modelArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let url = URL(string: modelArray[indexPath.row].url!)
        if UIApplication.shared.canOpenURL(url!) {
            UIApplication.shared.open(url!)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = articleTableView.dequeueReusableCell(withIdentifier: "ArticleCell") as! ArticleCell
        cell.dateLabel.text = modelArray[indexPath.row].id
        cell.titleLabel.text = modelArray[indexPath.row].articleTitle
        return cell
    }
    
}
