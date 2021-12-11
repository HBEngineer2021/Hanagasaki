//
//  VideoViewController.swift
//  Hanagasaki
//
//  Created by Motoki Onayama on 2021/07/24.
//

import UIKit

class VideoViewController: BaseViewController {
    @IBOutlet weak var videoCollectionView: UICollectionView!
    
    var modelArray = [modelVideo]()
    
    var vc = VideoEntryViewController()
    
    let cell = VideoCell()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        videoCollectionView.delegate = self
        videoCollectionView.dataSource = self
        addCustomCell()
        layoutCollectionView()
        addHeaderBar("Video",
                     UIBarButtonItem(image: #imageLiteral(resourceName: "bars_24"), style: .done, target: self, action: #selector(tapHambugerMenu)),
                     UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(tapAddVideo)))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        modelArray = ModelManager.getInstance().getAllVideo()
        videoCollectionView.reloadData()
    }
    
    func addCustomCell() {
        let customCell = UINib(nibName: "VideoCell", bundle: nil)
        videoCollectionView.register(customCell, forCellWithReuseIdentifier: "VideoCell")
    }
    
    func layoutCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        layout.itemSize = CGSize(width: 300, height: 300)
        videoCollectionView.collectionViewLayout = layout
    }
    
}

extension VideoViewController: UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return modelArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VideoCell", for: indexPath) as! VideoCell
        cell.number.text = modelArray[indexPath.row].videoTitle
        
        let base64String = modelArray[indexPath.row].image!
        let imageData = NSData(base64Encoded: base64String, options: .ignoreUnknownCharacters)
        if imageData == imageData {
            let image = UIImage(data: imageData! as Data)
        cell.imageVideo.image = image
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let horizontalSpace : CGFloat = 20
        let cellSize : CGFloat = self.view.bounds.width / 3 - horizontalSpace
        return CGSize(width: cellSize, height: cellSize)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let url = URL(string: modelArray[indexPath.row].url!)
        if UIApplication.shared.canOpenURL(url!) {
            UIApplication.shared.open(url!)
        }
    }
}
