//
//  BusinessCardViewController.swift
//  Hanagasaki
//
//  Created by Motoki Onayama on 2021/07/24.
//

import UIKit

class BusinessCardViewController: BaseViewController {
    @IBOutlet weak var imageQR: UIImageView!
    @IBOutlet weak var imageCard: UIImageView! {
        didSet {
            imageCard.layer.cornerRadius = 20
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addHeaderBar("Card", UIBarButtonItem(image: #imageLiteral(resourceName: "bars_24"), style: .done, target: self, action: #selector(tapHambugerMenu)), nil)
    }
    
    @IBAction func tiwitterQR(_ sender: UITapGestureRecognizer) {
        imageQR.image = UIImage(named: "twitter.PNG")
    }
    
    @IBAction func lineQR(_ sender: UITapGestureRecognizer) {
        imageQR.image = UIImage(named: "740ezdbw.png")
    }
    
    @IBAction func instagramQR(_ sender: UITapGestureRecognizer) {
        imageQR.image = UIImage(named: "IMG_4198.JPG")
    }
    
    @IBAction func noteQR(_ sender: UITapGestureRecognizer) {
        imageQR.image = UIImage(named: "IMG_4197.PNG")
    }
    
    @IBAction func youtubeQR(_ sender: UITapGestureRecognizer) {
        imageQR.image = UIImage(named: "qrcode_www.youtube.com.png")
    }

    @IBAction func blogURL(_ sender: UITapGestureRecognizer) {
        let url = URL(string: "twitter://user?screen_name=HB_itprog")
        if UIApplication.shared.canOpenURL(url!) {
            UIApplication.shared.open(url!)
        }
    }
    
}
