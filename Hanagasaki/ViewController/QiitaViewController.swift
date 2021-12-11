//
//  QiitaViewController.swift
//  Hanagasaki
//
//  Created by Motoki Onayama on 2021/07/24.
//

import UIKit

class QiitaViewController: BaseViewController {
    @IBOutlet weak var qiitaTableView: UITableView!
    
    let cellid = "cellid"
    
    var qiitas = [Qiita]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addHeaderBar("Qiita",
                     UIBarButtonItem(image: #imageLiteral(resourceName: "bars_24"), style: .plain, target: self, action: #selector(tapHambugerMenu)),
                     UIBarButtonItem(image: #imageLiteral(resourceName: "qiitaicon"), style: .done, target: self, action: #selector(tapQiitaIcon)))
        qiitaTableView.delegate = self
        qiitaTableView.dataSource = self
        qiitaTableView.register(QiitaTableViewCell.self, forCellReuseIdentifier: cellid)
        getQiitaApi()
    }

    func getQiitaApi() {
        let page = 20
        guard let url = URL(string: "https://qiita.com/api/v2/items?page=1&per_page=\(page)") else {return}
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: url) { (data, response, err) in
            if let err = err {
                print("情報の取得に失敗しました。：", err)
                return
            }
            
            if let data = data {
                do {
                    //let json = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
                    let qiita = try JSONDecoder().decode([Qiita].self, from: data)
                    self.qiitas = qiita
                    DispatchQueue.main.async {
                        self.qiitaTableView.reloadData()
                    }
                    print("json: ", qiita)
                } catch(let err) {
                    print("情報の取得に失敗しました。：", err)
                }
            }
        }
        task.resume()
    }
    
}

extension QiitaViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return qiitas.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = qiitaTableView.dequeueReusableCell(withIdentifier: cellid, for: indexPath) as! QiitaTableViewCell
        cell.qiita = qiitas[indexPath.row]
        cell.backgroundColor = .clear
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let url = URL(string: qiitas[indexPath.row].url)
        if UIApplication.shared.canOpenURL(url!) {
            UIApplication.shared.open(url!)
        }
    }
    
    
}
