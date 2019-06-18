//
//  FullScreeenPhotoClass.swift
//  GB-Vkontakte
//
//  Created by Vitaly_Shishlyannikov on 17.06.2019.
//  Copyright © 2019 Vit. All rights reserved.
//

import UIKit

class FullScreenPhotoController: UIViewController  {
    
    @IBOutlet weak var mainPhoto: UIImageView!
    @IBOutlet weak var nextPhoto: UIImageView!
    weak var previousPhoto: UIImageView!
    
    var indexPathSelected = IndexPath()
    
    var photos: [PhotoModel] = []
    
    override func viewDidLoad() {
        getPhotos()
        setPhotos()
        mainPhoto.addGestureRecognizer(swipeLeftGestureRecognizer)
    }
    
    func getPhotos () {
        photos = PhotosServerEmulator.getPhotos() ?? []
    }
    
    func setPhotos () {
        let currentPhoto = photos[indexPathSelected.row]
        let photoPath = currentPhoto.photoPath
        mainPhoto.image = UIImage(named: photoPath)
        
        let nextPhotoModel = photos[indexPathSelected.row + 1]
        let nextPhotoPath = nextPhotoModel.photoPath
        nextPhoto.image = UIImage(named: nextPhotoPath)
    }
    
    lazy var swipeLeftGestureRecognizer: UISwipeGestureRecognizer = {
        let recognizerLeft = UISwipeGestureRecognizer(target: self,
                                                action: #selector(onSwipe(_:)))
        recognizerLeft.direction = .left
        return recognizerLeft
        
    }()
    
    @objc func onSwipe(_ sender: UITapGestureRecognizer) {
        animatedPhotoRemoving()
     
    }
    
    func animatedPhotoRemoving() {
        
        let animationScale = CABasicAnimation(keyPath: "transform.scale")
        animationScale.fromValue = 1
        animationScale.toValue = 0
        animationScale.duration = 2
        animationScale.beginTime = CACurrentMediaTime()
        animationScale.fillMode = CAMediaTimingFillMode.backwards
        
        let animationOpacity = CABasicAnimation(keyPath: "opacity")
        animationOpacity.toValue = 0
        animationOpacity.duration = 2
        animationOpacity.fillMode = CAMediaTimingFillMode.backwards
        
        self.mainPhoto.layer.add(animationScale, forKey: nil)
        self.mainPhoto.layer.add(animationOpacity, forKey: nil)
        
        let animation2 = CABasicAnimation(keyPath: "position.x")
        animation2.fromValue = 500
        animation2.toValue = UIScreen.main.bounds.width / 2
        animation2.duration = 2
        animation2.beginTime = CACurrentMediaTime()
        
        self.nextPhoto.layer.add(animation2, forKey: nil)
        
        //indexPathSelected.row += 1
        let a = indexPathSelected.row
        //setPhotos()
        
//        let nextPhotoModel = photos[indexPathSelected.row + 1]
//        let nextPhotoPath = nextPhotoModel.photoPath
//        largePhoto.image = UIImage(named: nextPhotoPath)
//        indexPathSelected.row += 1
    }
}
