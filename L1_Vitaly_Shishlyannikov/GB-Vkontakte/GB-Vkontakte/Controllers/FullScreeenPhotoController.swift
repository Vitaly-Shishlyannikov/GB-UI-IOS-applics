//
//  FullScreeenPhotoClass.swift
//  GB-Vkontakte
//
//  Created by Vitaly_Shishlyannikov on 17.06.2019.
//  Copyright © 2019 Vit. All rights reserved.
//

import UIKit

class FullScreenPhotoController: UIViewController  {
    
    @IBOutlet weak var largePhoto: UIImageView!
    weak var nextPhoto: UIImageView!
    weak var previousPhoto: UIImageView!
    
    var indexPathSelected = IndexPath()
    
    var photos: [PhotoModel] = []
    
    override func viewDidLoad() {
        getPhotos()
        setPhotos()
        largePhoto.addGestureRecognizer(swipeLeftGestureRecognizer)
    }
    
    func getPhotos () {
        photos = PhotosServerEmulator.getPhotos() ?? []
    }
    
    func setPhotos () {
        let currentPhoto = photos[indexPathSelected.row]
        let photoPath = currentPhoto.photoPath
        largePhoto.image = UIImage(named: photoPath)
        
//        let nextPhotoModel = photos[indexPathSelected.row + 1]
//        let nextPhotoPath = nextPhotoModel.photoPath
//        nextPhoto.image = UIImage(named: "photo2")
        
    }
    
    lazy var swipeLeftGestureRecognizer: UISwipeGestureRecognizer = {
        let recognizerLeft = UISwipeGestureRecognizer(target: self,
                                                action: #selector(onSwipe(_:)))
        recognizerLeft.direction = .left
        return recognizerLeft
        
    }()
    
    @objc func onSwipe(_ sender: UITapGestureRecognizer) {
        animatedPhotoRemoving()
        let nextPhotoModel = photos[indexPathSelected.row + 1]
        let nextPhotoPath = nextPhotoModel.photoPath
        largePhoto.image = UIImage(named: nextPhotoPath)
        indexPathSelected.row += 1
    }
    
    func animatedPhotoRemoving() {
        let animation = CASpringAnimation(keyPath: "transform.scale")
        animation.fromValue = 1
        animation.toValue = 1
        animation.stiffness = 200
        animation.mass = 1
        animation.duration = 1
        animation.beginTime = CACurrentMediaTime()
        animation.fillMode = CAMediaTimingFillMode.backwards
        
        self.largePhoto.layer.add(animation, forKey: nil)
    }
}
