//
//  CustomDelaySegue.swift
//  GB-Vkontakte
//
//  Created by Vitaly_Shishlyannikov on 11.06.2019.
//  Copyright © 2019 Vit. All rights reserved.
//

import UIKit

class CustomDelaySegue: NSObject, UIViewControllerAnimatedTransitioning, UIViewControllerTransitioningDelegate {
    
     // MARK: методы протокола UIViewControllerAnimatedTransitioning
    
    // метод, в котором непосредственно указывается анимация перехода от одного  viewcontroller к другому
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        // код анимации
    }
    
    // метод возвращает количество секунд, которые длится анимация
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 1
    }
    
    // MARK: методы протокола UIViewControllerTransitioningDelegate
    
    // аниматор для презентации viewcontroller
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self
    }
    
    // аниматор для скрытия viewcontroller
    func animationControllerForDismissedController(dismissed: UIViewController) ->
        UIViewControllerAnimatedTransitioning? {
            return self
    }
}
