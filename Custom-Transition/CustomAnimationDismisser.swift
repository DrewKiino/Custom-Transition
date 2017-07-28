//
//  CustomAnimationDismisser.swift
//  ViewAllocationsExample
//
//  Created by Jason Picallos on 7/28/17.
//  Copyright © 2017 Greek APP. All rights reserved.
//

import UIKit


class CustomAnimationDismisser : NSObject , UIViewControllerAnimatedTransitioning {

    
    // MARK: Delegates
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 2.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        // Custom animation container for adding subviews
        let containerView = transitionContext.containerView
        
        guard let fromView = transitionContext.view(forKey: .from),
        let toView = transitionContext.view(forKey: .to) else { return }
        
        // Add View to container
        containerView.addSubview(toView)
        
        // Animate
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: { 
            // Set the frames post animation of dismissal
            fromView.frame = CGRect(x: 0, y: fromView.frame.height, width: fromView.frame.width, height: fromView.frame.height)
            toView.frame = CGRect(x: 0, y: 0, width: toView.frame.width, height: toView.frame.height)
            
        }) { (_) in
            transitionContext.completeTransition(true)
        }
        
    }
    
}

