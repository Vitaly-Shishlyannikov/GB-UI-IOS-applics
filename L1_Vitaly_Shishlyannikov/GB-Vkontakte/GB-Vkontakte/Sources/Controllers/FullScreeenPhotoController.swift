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
        mainPhoto.addGestureRecognizer(swipeRightGestureRecognizer)
    }
    
    func getPhotos () {
        photos = PhotosServerEmulator.getPhotos() ?? []
    }
    
    func setPhotos () {
        if indexPathSelected.row >= 0,
            indexPathSelected.row < photos.count - 1 {
        let currentPhotoIndex = photos[indexPathSelected.row]
        let photoPath = currentPhotoIndex.photoPath
        mainPhoto.image = UIImage(named: photoPath)
        
        let nextPhotoIndex = photos[indexPathSelected.row + 1]
        let nextPhotoPath = nextPhotoIndex.photoPath
        nextPhoto.image = UIImage(named: nextPhotoPath)
        }
    }
    
    lazy var swipeLeftGestureRecognizer: UISwipeGestureRecognizer = {
        let recognizerLeft = UISwipeGestureRecognizer(target: self,
                                                action: #selector(onSwipeLeft(_:)))
        recognizerLeft.direction = .left
        return recognizerLeft
    }()
    
    @objc func onSwipeLeft(_ sender: UITapGestureRecognizer) {
        if indexPathSelected.row < photos.count - 1 {
        animatedPhotoChangeLeft()
        indexPathSelected.row += 1
        //setPhotos()
        }
    }
    
    func animatedPhotoChangeLeft() {
        
        let animationScale = CABasicAnimation(keyPath: "transform.scale")
        animationScale.fromValue = 1
        animationScale.toValue = 0
        animationScale.duration = 1
        animationScale.beginTime = CACurrentMediaTime()
        animationScale.fillMode = CAMediaTimingFillMode.backwards
        
        let animationOpacity = CABasicAnimation(keyPath: "opacity")
        animationOpacity.toValue = 0
        animationOpacity.duration = 1
        animationOpacity.fillMode = CAMediaTimingFillMode.backwards
        
        self.mainPhoto.layer.add(animationScale, forKey: nil)
        self.mainPhoto.layer.add(animationOpacity, forKey: nil)
        
        let animationMoveLeft = CABasicAnimation(keyPath: "position.x")
        animationMoveLeft.fromValue = 500
        animationMoveLeft.toValue = self.view.frame.size.width / 2
        animationMoveLeft.duration = 1
        animationMoveLeft.beginTime = CACurrentMediaTime()
        
        self.nextPhoto.layer.add(animationMoveLeft, forKey: nil)
        
        setPhotos()
    }
    
    lazy var swipeRightGestureRecognizer: UISwipeGestureRecognizer = {
        let recognizerRight = UISwipeGestureRecognizer(target: self,
                                                       action: #selector(onSwipeRight(_:)))
        recognizerRight.direction = .right
        return recognizerRight
    }()
    
    @objc func onSwipeRight(_ sender: UITapGestureRecognizer) {
        if indexPathSelected.row >= 0 {
            animatedPhotoChangeRight()
            indexPathSelected.row -= 1
            //setPhotos()
        }
    }
    
    func animatedPhotoChangeRight() {
        
        let animationScale = CABasicAnimation(keyPath: "transform.scale")
        animationScale.fromValue = 1
        animationScale.toValue = 0
        animationScale.duration = 1
        animationScale.beginTime = CACurrentMediaTime()
        animationScale.fillMode = CAMediaTimingFillMode.backwards
        
        let animationOpacity = CABasicAnimation(keyPath: "opacity")
        animationOpacity.toValue = 0
        animationOpacity.duration = 1
        animationOpacity.fillMode = CAMediaTimingFillMode.backwards
        
        self.nextPhoto.layer.add(animationScale, forKey: nil)
        self.nextPhoto.layer.add(animationOpacity, forKey: nil)
        
        let animationMoveRight = CABasicAnimation(keyPath: "position.x")
        animationMoveRight.fromValue = -500
        animationMoveRight.toValue = self.view.frame.size.width / 2
        animationMoveRight.duration = 1
        animationMoveRight.beginTime = CACurrentMediaTime()
        
        self.mainPhoto.layer.add(animationMoveRight, forKey: nil)
        
        setPhotos()
    }
}
