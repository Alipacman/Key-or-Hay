//
//  EntranceViewController.swift
//  Key or Hay
//
//  Created by Ali Ebrahimi Pourasad on 16.08.18.
//  Copyright © 2018 Ali Ebrahimi Pourasad. All rights reserved.
//

import UIKit

class EntranceViewController: UIViewController, DownloadDelegate {
    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    func everythingDownloaded(_ sender: ImageNewtworkCon) {
        startButton.isHidden = false
        activityIndicator.stopAnimating()
        activityIndicator.isHidden = true
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.startAnimating()
        startButton.isHidden = true
        let imageNewtworkCon = ImageNewtworkCon(self)
        imageNewtworkCon.start()
    }

}
