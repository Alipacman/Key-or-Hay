//
//  EntranceViewController.swift
//  Key or Hay
//
//  Created by Ali Ebrahimi Pourasad on 16.08.18.
//  Copyright © 2018 Ali Ebrahimi Pourasad. All rights reserved.
//

import UIKit
import Hero
import Spring
import Pastel

class EntranceViewController: UIViewController, imgDownloadDelegate {
    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var springImageView: SpringImageView!
    
    
    func downloadFinished(_ sender: ImageDownloadController) {
        startButton.isHidden = false
        activityIndicator.stopAnimating()
        activityIndicator.isHidden = true
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.startAnimating()
        startButton.isHidden = true
        let imageDownloadController = ImageDownloadController(self)
        imageDownloadController.loadImgWithPromise()
        
//        delete from here
        GoldLable.text = String (Gold.sharedGold.value)
        
        self.hero.isEnabled = true
        
        let pastelView = PastelView(frame: view.bounds)
        
        // Custom Direction
        pastelView.startPastelPoint = .bottomLeft
        pastelView.endPastelPoint = .topRight
        
        // Custom Duration
        pastelView.animationDuration = 2.0
        
        // Custom Color
        pastelView.setColors([UIColor(red: 156/255, green: 39/255, blue: 176/255, alpha: 1.0),
                              UIColor(red: 255/255, green: 64/255, blue: 129/255, alpha: 1.0),
                              UIColor(red: 123/255, green: 31/255, blue: 162/255, alpha: 1.0)])
        
        pastelView.startAnimation()
        view.insertSubview(pastelView, at: 0)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        HeartController.initImageView(springImageView: self.springImageView)
    }

    @IBAction func showGold(_ sender: Any) {
        GoldLable.text = "Gold: " + String (Gold.sharedGold.value)
    }
    @IBAction func add10(_ sender: Any) {
        Gold.addGold(toAdd: 10)
    }
    @IBOutlet weak var GoldLable: UILabel!
}
