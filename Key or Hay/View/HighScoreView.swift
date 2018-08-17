//
//  HighScoreViewController.swift
//  Key or Hay
//
//  Created by Ali Ebrahimi Pourasad on 24.02.18.
//  Copyright © 2018 Ali Ebrahimi Pourasad. All rights reserved.
//

import UIKit

class HighScoreViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var HighscoreLabel: UILabel!
    
    var userScore = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scoreLabel.text = "Dein Score: \(userScore)"
    }
    
    
    @IBAction func restart(_ sender: Any) {
        performSegue(withIdentifier: "restart", sender: self)
        
    }    
}
