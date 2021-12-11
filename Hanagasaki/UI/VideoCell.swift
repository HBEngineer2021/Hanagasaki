//
//  VideoCell.swift
//  Hanagasaki
//
//  Created by Motoki Onayama on 2021/07/31.
//

import UIKit

class VideoCell: UICollectionViewCell {
    @IBOutlet weak var number: UILabel!
    @IBOutlet weak var imageVideo: UIImageView! {
        didSet {
            imageVideo.layer.cornerRadius = 150
        }
    }
    
}
