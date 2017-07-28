//
//  CustomAnimationPresenter.swift
//  ViewAllocationsExample
//
//  Created by Jason Picallos on 7/28/17.
//  Copyright © 2017 Greek APP. All rights reserved.
//

import UIKit


// Custom object animation present
class CustomAnimationPresenter : NSObject , UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 2.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        // Custom animation transition
        let containerView = transitionContext.containerView
        
        // View Transitioning to
        guard let toView =  transitionContext.view(forKey: .to) else { return }
        containerView.addSubview(toView)
        
        guard let fromView = transitionContext.view(forKey: .from) else { return }
        
        // Set frame prior to animation
        let startingFrame = CGRect(x: 0, y: toView.frame.height, width: toView.frame.width, height: toView.frame.height)
        toView.frame = startingFrame
        
        // Animate
        UIView.animate(withDuration: 0.5 , delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            
            // Set frame post leaving animation
            toView.frame = CGRect(x: 0, y: 0, width: toView.frame.width, height: toView.frame.height)
            fromView.frame = CGRect(x: 0, y: -fromView.frame.height, width: fromView.frame.width, height: fromView.frame.height)
            
            
        }) { (_) in
            // Complete Animation
            transitionContext.completeTransition(true)

        }
        
    }
}
