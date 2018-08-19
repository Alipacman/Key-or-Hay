//
//  EntranceViewController.swift
//  Key or Hay
//
//  Created by Ali Ebrahimi Pourasad on 16.08.18.
//  Copyright © 2018 Ali Ebrahimi Pourasad. All rights reserved.
//

import UIKit

class EntranceViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let networkController = NetworkController()
        networkController.start()
    }

}
