//
//  FriendCell.swift
//  GB-Vkontakte
//
//  Created by Vitaly_Shishlyannikov on 27.05.2019.
//  Copyright © 2019 Vit. All rights reserved.
//

import UIKit

class FriendCell: UITableViewCell {
    
    static let reuseIdentifier = "FriendCell"
    
    @IBOutlet weak var friendNameLabel: UILabel!
    @IBOutlet weak var friendAvatar: RoundAvatarView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        addGestureRecognizer(tapGestureRecognizer)
    }
    
    lazy var tapGestureRecognizer: UITapGestureRecognizer = {
        let recognizer = UITapGestureRecognizer(target: self,
                                                action: #selector(onTap(_:)))
        recognizer.numberOfTapsRequired = 1
        recognizer.numberOfTouchesRequired = 1
        return recognizer
    }()
    
    @objc func onTap(_ sender: RoundAvatarView) {
        animateAvatar()
    }
    
    func animateAvatar() {
        let animation = CASpringAnimation(keyPath: "transform.scale")
        animation.fromValue = 0
        animation.toValue = 1
        animation.stiffness = 200
        animation.mass = 1
        animation.duration = 1
        animation.beginTime = CACurrentMediaTime()
        animation.fillMode = CAMediaTimingFillMode.backwards
        
        self.friendAvatar.layer.add(animation, forKey: nil)
    }
}

