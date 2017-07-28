//
//  ViewController.swift
//  Custom-Transition
//
//  Created by Jason Picallos on 7/28/17.
//  Copyright © 2017 Greek APP. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Set UI
        navigationController?.isNavigationBarHidden = true
        
        
        // Button Creation
        let btn: UIButton = UIButton(frame: CGRect(x: 100, y: 400, width: 100, height: 50))
        btn.backgroundColor = UIColor.green
        btn.setTitle("Next View", for: .normal)
        btn.addTarget(self, action: #selector(ViewController.nextView), for: .touchUpInside)
        btn.tag = 1
        self.view.addSubview(btn)
        self.view.backgroundColor = UIColor.groupTableViewBackground
        
    }
    
    // Present New View Method
    @objc func nextView() {
        self.present(NewView(), animated: true, completion: nil)
    }

}

