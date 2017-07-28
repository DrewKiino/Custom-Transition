//
//  NewView.swift
//  ViewAllocationsExample
//
//  Created by Jason Picallos on 7/27/17.
//  Copyright © 2017 Greek APP. All rights reserved.
//

import UIKit

class NewView: UIViewController, UIViewControllerTransitioningDelegate {

    
    // Initialize class variables
    let customAnimationPresenter = CustomAnimationPresenter()
    let customAnimationDismisser = CustomAnimationDismisser()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Call delegate to viewcontroller for animation
        self.transitioningDelegate = self
        
        
        
        // Set UI
        self.view.backgroundColor = .gray
        navigationController?.isNavigationBarHidden = true
        
        
        
        // Custom Button
        let btn: UIButton = UIButton(frame: CGRect(x: 100, y: 400, width: 100, height: 50))
        btn.backgroundColor = UIColor.darkGray
        btn.setTitle("Back", for: .normal)
        btn.addTarget(self, action: #selector(NewView.popBack), for: .touchUpInside)
        btn.tag = 1
        self.view.addSubview(btn)
        self.view.backgroundColor = UIColor.white
        
    }
    
    // MARK: Animation Protocols conforming to Delegate
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return customAnimationPresenter
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return customAnimationDismisser
    }
   
    @objc func popBack() {
        self.dismiss(animated: true, completion: nil)
    }
    
    
}
