//
//  ActorPhotoViewController.swift
//  Homework50LightTheNight
//
//  Created by 黃柏嘉 on 2022/1/10.
//

import UIKit
private let reuseIdentifier = "ImageCell"

class ActorPhotoViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    @IBOutlet weak var myCollectionView: UICollectionView!
    @IBOutlet weak var apPageControl: UIPageControl!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setFlowLayout()
        apPageControl.allowsContinuousInteraction = false
    }
    
    func setFlowLayout(){
        let flowLayout = myCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        flowLayout.itemSize = myCollectionView.bounds.size
        flowLayout.estimatedItemSize = .zero
        flowLayout.minimumLineSpacing = 0
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.sectionInset = .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = myCollectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ActorPhotoCollectionViewCell
        cell.actorPhotoImageView.image = UIImage(named: "AP\(indexPath.item+1)")
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let cell = cell as! ActorPhotoCollectionViewCell
        cell.updateZoom()
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let page = scrollView.contentOffset.x/scrollView.bounds.width
        apPageControl.currentPage = Int(page)
    }

}
