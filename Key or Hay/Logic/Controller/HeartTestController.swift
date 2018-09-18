//
//  HeartTestController.swift
//  Key or Hay
//
//  Created by Ali Ebrahimi Pourasad on 25.08.18.
//  Copyright © 2018 Ali Ebrahimi Pourasad. All rights reserved.
//

import UIKit
import Spring

class HeartTestController: UIViewController {
    
    @IBOutlet weak var imageView: SpringImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        HeartController.initImageView(springImageView: self.imageView)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
