//
//  ArticleEntryViewController.swift
//  Hanagasaki
//
//  Created by Motoki Onayama on 2021/08/08.
//

import UIKit

class ArticleEntryViewController: BaseViewController, UITextFieldDelegate {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var urlLabel: UILabel!
    
    var articleTitle: String?
    var url: String?
    
    @IBOutlet weak var titleTextField: UITextField! {
        didSet {
            titleTextField.backgroundColor = .systemFill
            titleTextField.placeholder = "Add title ."
        }
    }
    
    @IBOutlet weak var urlTextField: UITextField! {
        didSet {
            urlTextField.backgroundColor = .systemFill
            urlTextField.placeholder = "Add url ."
        }
    }
    
    @IBOutlet weak var entryButton: UIButton! {
        didSet {
            entryButton.layer.cornerRadius = 10
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addHeaderBar("ArticleEntry", nil, nil)
        titleTextField.delegate = self
        urlTextField.delegate = self
        tapEnable()
    }
    
    func tapEnable() {
        entryButton.isEnabled = false
        entryButton.backgroundColor = .black.withAlphaComponent(0.15)
    }
    
    @IBAction func TextFieldActionBtnInactive(_ sender: Any) {
        if titleTextField.text == "" {
            entryButton.isEnabled = false
            entryButton.backgroundColor = .black.withAlphaComponent(0.15)
        }
        else if urlTextField.text == "" {
            entryButton.isEnabled = false
            entryButton.backgroundColor = .black.withAlphaComponent(0.15)
        } else {
            entryButton.isEnabled = true
            entryButton.backgroundColor = UIColor(hex: 0xFF19FDD3)
        }
    }
    
    @IBAction func TextFieldActionBtnInactive1(_ sender: Any) {
        if urlTextField.text == "" {
            entryButton.isEnabled = false
            entryButton.backgroundColor = .black.withAlphaComponent(0.15)
        } else if titleTextField.text == "" {
            entryButton.isEnabled = false
            entryButton.backgroundColor = .black.withAlphaComponent(0.15)
        } else {
            entryButton.isEnabled = true
            entryButton.backgroundColor = UIColor(hex: 0xFF19FDD3)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func articleEntry(_ sender: UIButton) {
        
        let article = modelArticle(id: "", articleTitle: titleTextField.text, url: urlTextField.text)
        let isSave = ModelManager.getInstance().Save(article: article)
        
        dismiss(animated: true, completion: nil)
        print("isSave : -\(isSave)")
        
    }
    
    
}
