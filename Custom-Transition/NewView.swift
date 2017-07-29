//
//  NewView.swift
//  ViewAllocationsExample
//
//  Created by Jason Picallos on 7/27/17.
//  Copyright © 2017 Greek APP. All rights reserved.
//

import UIKit

class NewView: UIViewController {
  
  deinit {
    print("deinit")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    print("view loaded")
    
    // Set UI
    self.view.backgroundColor = .gray
    navigationController?.isNavigationBarHidden = true
    
    // Custom Button
    let btn: UIButton = UIButton(frame: CGRect(x: 100, y: 400, width: 100, height: 50))
    btn.backgroundColor = UIColor.darkGray
    btn.setTitle("Back", for: .normal)
    btn.addTarget(self, action: #selector(self.popBack), for: .touchUpInside)
    btn.tag = 1
    self.view.addSubview(btn)
    self.view.backgroundColor = UIColor.white
    
    // Custom Button
    let btn2: UIButton = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 50))
    btn2.backgroundColor = UIColor.darkGray
    btn2.setTitle("Next", for: .normal)
    btn2.addTarget(self, action: #selector(self.nextView), for: .touchUpInside)
    btn2.tag = 1
    self.view.addSubview(btn2)
  }
  
  func popBack() {
//     self.dismiss(animated: true, completion: nil)
          self.navigationController?.popViewController(animated: true)
//          self.navigationController?.popToRootViewController(animated: true)
//    if let viewControllers = self.navigationController?.viewControllers {
//      self.navigationController?.popToViewController(viewControllers[2], animated: true)
//    }
  }
  
  // Present New View Method
  func nextView() {
//        self.present(NewView(), animated: true, completion: nil)
    self.navigationController?.pushViewController(NewView(), animated: true)
  }
}
