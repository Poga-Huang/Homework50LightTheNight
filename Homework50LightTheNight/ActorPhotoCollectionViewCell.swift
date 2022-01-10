//
//  ActorPhotoCollectionViewCell.swift
//  Homework50LightTheNight
//
//  Created by 黃柏嘉 on 2022/1/10.
//

import UIKit

class ActorPhotoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var zoomingScrollView: UIScrollView!
    @IBOutlet weak var actorPhotoImageView: UIImageView!
    
    func updateContent(){
        guard let imageHeight = actorPhotoImageView.image?.size.height else{return}
        let inset = (zoomingScrollView.bounds.height-imageHeight*zoomingScrollView.zoomScale)/2
        zoomingScrollView.contentInset = .init(top: max(inset, 0), left: 0, bottom: 0, right: 0)
    }
    
    func updateZoom(){
        zoomingScrollView.zoomScale = 1
        zoomingScrollView.minimumZoomScale = 1
        zoomingScrollView.maximumZoomScale = 5
        updateContent()
    }
}

extension ActorPhotoCollectionViewCell:UIScrollViewDelegate{
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        actorPhotoImageView
    }
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        updateContent()
    }
}
