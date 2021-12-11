//
//  VideoEntryViewController.swift
//  Hanagasaki
//
//  Created by Motoki Onayama on 2021/08/08.
//

import UIKit

class VideoEntryViewController: BaseViewController, UITextFieldDelegate {

    @IBOutlet weak var selectImageBtn: UIButton! {
        didSet {
            selectImageBtn.layer.cornerRadius = 75
        }
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var urlLabel: UILabel!
    
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
        addHeaderBar("VideoEntry", nil, nil)
        tapEnable()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            self.view.endEditing(true)
    }
    
    @IBAction func tapUploadImage(_ sender: UIButton) {
        /*if isEdit == true {
                   updateImageData()
               }*/
               print("tappedProfileImageButton")
               let imagePickerController = UIImagePickerController()
               imagePickerController.delegate = self
               imagePickerController.allowsEditing = true
               
               self.present(imagePickerController, animated: true, completion: nil)
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
    
    @IBAction func videoEntry(_ sender: UIButton) {
        
        //TODO: base64に変化
        //let base64 =
        //let decode =
        
        let selectVideoImage = (selectImageBtn.imageView?.image!.pngData()!)! as NSData
               let base64String = selectVideoImage.base64EncodedString(options: .lineLength64Characters)
               print(base64String)
        
        let video = modelVideo(id: "", videoTitle: titleTextField.text, image: base64String, url: urlTextField.text)
        let isSave = ModelManager.getInstance().SaveVideo(video: video)
        
        dismiss(animated: true, completion: nil)
        
        print("isSave : -\(isSave)")
    }
}

extension VideoEntryViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
   func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
       if let editingImage = info[.editedImage] as? UIImage {
        selectImageBtn.setImage(editingImage.withRenderingMode(.alwaysOriginal), for: .normal) } else if let originalImage = info[.originalImage] as? UIImage {
            selectImageBtn.setImage(originalImage.withRenderingMode(.alwaysOriginal), for: .normal)
       }
       
    selectImageBtn.setTitle("", for: .normal)
    selectImageBtn.imageView?.contentMode = .scaleAspectFill
    selectImageBtn.contentHorizontalAlignment = .fill
    selectImageBtn.contentVerticalAlignment = .fill
    selectImageBtn.clipsToBounds = true
       
       dismiss(animated: true, completion: nil)
       
   }
}
