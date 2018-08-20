//
//  HighScoreViewController.swift
//  Key or Hay
//
//  Created by Ali Ebrahimi Pourasad on 24.02.18.
//  Copyright © 2018 Ali Ebrahimi Pourasad. All rights reserved.
//

import UIKit

class HighScoreViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var HighscoreLabel: UILabel!
    @IBOutlet weak var nameField: UITextField!
    
    var userScore = 0
    var scoreDownloadController : ScoreDownloadController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scoreLabel.text = "Dein Score: \(userScore)"
        scoreDownloadController = ScoreDownloadController()
        self.nameField.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    @IBAction func restart(_ sender: Any) {
        performSegue(withIdentifier: "restart", sender: self)
        
    }
    
    @IBAction func submitScoreButtonPressed(_ sender: Any) {
        self.scoreDownloadController!.submitScore(scoreEntry: ScoreEntry(name: nameField.text!, score: Int((scoreLabel.text?.lastWord)!)!))
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Scoreboard"{
            let scoresArray = self.scoreDownloadController!.giveScore()
            let destinySegue = segue.destination as! ScoresTableViewController
            destinySegue.scoreArray = scoresArray
        }
    }
}
