//
//  CustomNavigationController.swift
//  GB-Vkontakte
//
//  Created by Vitaly_Shishlyannikov on 20.06.2019.
//  Copyright © 2019 Vit. All rights reserved.
//

import UIKit

class CustomNavigationController: UINavigationController, UINavigationControllerDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
    }
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if operation == .push {
            return CustomPushAnimator()
        } else if operation == .pop {
            return CustomPushAnimator()
        }
        return nil
    }
}
