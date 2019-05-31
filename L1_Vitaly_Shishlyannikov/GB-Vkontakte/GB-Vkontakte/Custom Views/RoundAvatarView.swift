//
//  RoundAvatarView.swift
//  GB-Vkontakte
//
//  Created by Vitaly_Shishlyannikov on 28.05.2019.
//  Copyright © 2019 Vit. All rights reserved.
//

import UIKit

class RoundAvatarView: UIImageView {
    
    var cornerRadius: CGFloat {
        return frame.width/2
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        sharedInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        sharedInit()
    }
    
    override func prepareForInterfaceBuilder() {
        sharedInit()
    }
    
    func sharedInit() {
        setCornerRadius(value: cornerRadius)
    }
    
    func setCornerRadius(value: CGFloat) {
        layer.cornerRadius = value
    }
}

