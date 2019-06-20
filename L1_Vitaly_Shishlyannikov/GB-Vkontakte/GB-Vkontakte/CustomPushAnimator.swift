//
//  CustomPushAnimator.swift
//  GB-Vkontakte
//
//  Created by Vitaly_Shishlyannikov on 20.06.2019.
//  Copyright © 2019 Vit. All rights reserved.
//

import UIKit

class CustomPushAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 1
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let source = transitionContext.viewController(forKey: .from) else {return}
        guard let destination = transitionContext.viewController(forKey: .to) else {return}
        transitionContext.containerView.addSubview(destination.view)
        destination.view.frame = source.view.frame
        
        destination.view.layer.anchorPoint = CGPoint(x: 1, y: 0)
        destination.view.layer.position = CGPoint(x: source.view.frame.width, y: 0)
    
        let rotation = CGAffineTransform(rotationAngle: -90 * .pi / 180)
        destination.view.transform = rotation
        
        UIView.animate(withDuration: self.transitionDuration(using: transitionContext), animations: {
            let rotation = CGAffineTransform(rotationAngle: 0)
            destination.view.transform = rotation
        })
    }
}
