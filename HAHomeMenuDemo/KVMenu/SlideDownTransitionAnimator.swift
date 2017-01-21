//
//  SlideDownTransitionAnimator.swift
//  HAHomeMenu
//
//  Created by  Hitesh Ahuja on 2016/3/29.
//  Copyright © 2016 Hitesh Ahuja. All rights reserved.
//

import UIKit

class SlideDownTransitionAnimator: NSObject, UIViewControllerAnimatedTransitioning, UIViewControllerTransitioningDelegate {
    
    var duration = 0.5
    var isPresenting = false
    
    //MARK: -- UIViewControllerTransitioningDelegate
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        isPresenting = true
        return self
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        isPresenting = false
        return self
    }
    
    
    //MARK: - UIViewControllerAnimatedTransitioning
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        //get view
        let fromView = transitionContext.view(forKey: UITransitionContextViewKey.from)!
        let toView = transitionContext.view(forKey: UITransitionContextViewKey.to)!
        
        //transform
        let container = transitionContext.containerView
        let offScreenUp = CGAffineTransform(translationX: 0, y: -(container.frame.height))
        let offScreenDown = CGAffineTransform(translationX: 0, y: (container.frame.height))
        
        //toView
        if isPresenting {
            toView.transform = offScreenUp
        }
        
        //container view
        container.addSubview(fromView)
        container.addSubview(toView)
    
        
        UIView.animate(withDuration: duration, delay: 0.0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.8, options: UIViewAnimationOptions(), animations: { 
            
            if self.isPresenting{
                
                fromView.transform = offScreenDown
                fromView.alpha = 0.5
                toView.transform = CGAffineTransform.identity
            }else{
                fromView.transform = offScreenUp
                toView.alpha = 1.0
                toView.transform = CGAffineTransform.identity
            }
            
            
        }) { (finished) in
            
            transitionContext.completeTransition(true)
            
        }
        
    }
}
