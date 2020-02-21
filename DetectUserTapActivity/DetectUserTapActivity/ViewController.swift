//
//  ViewController.swift
//  DetectUserTapActivity
//
//  Created by Tejora on 02/05/19.
//  Copyright © 2019 Tejora. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        NotificationCenter.default.addObserver(self, selector: #selector(inActTimOut), name: .TimeOutUserInteraction, object: nil)
    }
  
    @objc func inActTimOut(){
        print("timeout after 15 mins")
    }

    @IBAction func btnClicked(_ sender: Any) {
        print("Clicked action")
    }
}

