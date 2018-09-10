//
//  HighScoreViewController.swift
//  Key or Hay
//
//  Created by Ali Ebrahimi Pourasad on 24.02.18.
//  Copyright © 2018 Ali Ebrahimi Pourasad. All rights reserved.
//

import UIKit
import Spring
import Hero

class HighScoreViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var HighscoreLabel: UILabel!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var springImageView: SpringImageView!
    
    var userScore = 0
    var scoreDownloadController : ScoreDownloadController?
    var scoreArray : [ScoreEntry] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        scoreLabel.text = "Dein Score: \(userScore)"
        self.scoreDownloadController = ScoreDownloadController()
        self.nameField.delegate = self
        
        self.scoreArray.removeAll()
        self.scoreArray = (scoreDownloadController?.getScores())!
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.hero.isEnabled = true
        HeartController.initImageView(springImageView: self.springImageView)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    @IBAction func restart(_ sender: Any) {
        performSegue(withIdentifier: "restart", sender: self)
        
    }
    
    @IBAction func submitScoreButtonPressed(_ sender: Any) {
        let uuid = UIDevice.current.identifierForVendor?.uuidString
        
        if let score = self.scoreDownloadController!.submitScore(scoreArray : scoreArray, scoreEntry: ScoreEntry(uuid : uuid!, name: nameField.text!, score: Int((scoreLabel.text?.lastWord)!)!)){
            scoreArray.append(score)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Scoreboard"{
            let destinySegue = segue.destination as! ScoresTableViewController
            destinySegue.scoreArray = self.scoreArray
        }
    }
}
