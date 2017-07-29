//
//  NavigationController.swift
//  Custom-Transition
//
//  Created by Andrew Aquino on 7/28/17.
//  Copyright © 2017 Greek APP. All rights reserved.
//

import Foundation
import UIKit

class NavigationController: UINavigationController, UIViewControllerTransitioningDelegate, UINavigationControllerDelegate {
  
  enum Transition {
    case push
    case pop
  }
  
  var currentTransition: Transition = .push
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    delegate = self
    transitioningDelegate = self
  }
  
  
  // MARK: Animation Protocols conforming to Delegate
  func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    print("mark1")
    return CustomAnimationPresenter()
  }
  
  func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    print("mark2")
    return CustomAnimationDismisser()
  }
  
  // navigation Controller custom animation method overrides
  override func pushViewController(_ viewController: UIViewController, animated: Bool) {
    self.currentTransition = .push
    super.pushViewController(viewController, animated: animated)
  }
  
  override func popViewController(animated: Bool) -> UIViewController? {
    self.currentTransition = .pop
    return super.popViewController(animated: animated)
  }
  
  override func popToRootViewController(animated: Bool) -> [UIViewController]? {
    self.currentTransition = .pop
    return super.popToRootViewController(animated: animated)
  }
  
  override func popToViewController(_ viewController: UIViewController, animated: Bool) -> [UIViewController]? {
    self.currentTransition = .pop
    return super.popToViewController(viewController, animated: animated)
  }
  
  func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    switch currentTransition {
    case .push: return CustomAnimationPresenter()
    case .pop: return CustomAnimationDismisser()
    }
  }
}
