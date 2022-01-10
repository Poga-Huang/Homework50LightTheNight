//
//  StagePhotoCollectionViewCell.swift
//  Homework50LightTheNight
//
//  Created by 黃柏嘉 on 2022/1/10.
//

import UIKit

class StagePhotoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var zoomingScrollView: UIScrollView!
    @IBOutlet weak var stagePhotoImageView: UIImageView!
    
    
    func updateContentInset(){
        guard let imageHeight = stagePhotoImageView.image?.size.height else{return}
        let inset = (zoomingScrollView.bounds.height-imageHeight*zoomingScrollView.zoomScale)/2
        zoomingScrollView.contentInset = .init(top: max(inset, 0), left: 0, bottom:0, right: 0)
    }
    
    //更新scrollView的比例
    
    func updateZoom(){
        zoomingScrollView.minimumZoomScale = 1
        zoomingScrollView.maximumZoomScale = 3
        zoomingScrollView.zoomScale = 1
        updateContentInset()
    }
}

extension StagePhotoCollectionViewCell:UIScrollViewDelegate{
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        stagePhotoImageView
    }
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        updateContentInset()
    }
}
