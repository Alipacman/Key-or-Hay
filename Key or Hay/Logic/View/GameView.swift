//
//  GameController.swift
//  Key or Hay
//
//  Created by Ali Ebrahimi Pourasad on 31.10.17.
//  Copyright © 2017 Ali Ebrahimi Pourasad. All rights reserved.
//

import UIKit
import Spring
import ZLSwipeableViewSwift
import AMProgressBar
import ChameleonFramework
import LGButton
import Pastel

class GameView: UIViewController, PreparationDelegate, TimerDelegate,  UITextFieldDelegate{
    
    var gamePrepController : GamePrepController?
    var cardPointController : CardPointController?
    var timeController : TimeController?
    var scoreNetworkController : ScoreNetworkController?
    var musicController : MusicController?
    
    var scoreArray : [ScoreEntry]!
    var pastel : PastelView?
    
    var counter = 0
    var preparationTime = 4
    var gameLenght = 20.0
    var pointCounter = 0
    var scoreMode = false
    
    
    var colorArray = NSArray(ofColorsWith: ColorScheme.analogous, using: UIColor.flatPurple(), withFlatScheme: true)
    
    @IBOutlet weak var zlSpringView: SpringView!
    @IBOutlet weak var zLSwipeableView: ZLSwipeableView!
    
    @IBOutlet weak var healtBarSpringView: SpringView!
    @IBOutlet weak var healthBar: AMProgressBar!
    
    @IBOutlet weak var countdownLable: SpringLabel!
    @IBOutlet weak var pointLabel: SpringLabel!
    
    @IBOutlet weak var heartImageView: SpringImageView!
    
    @IBOutlet weak var leftButtonSpringView: SpringView!
    @IBOutlet weak var midButtonSpringView: SpringView!
    @IBOutlet weak var rightButtonSpringView: SpringView!
    
    @IBOutlet weak var inGameRestartButton: SpringButton!
    
    @IBOutlet weak var highscoreSpringView: SpringView!
    
    @IBOutlet weak var achievedScore: UILabel!
    @IBOutlet weak var nameField: UITextField!

    @IBOutlet var topNames : [UILabel]!
    @IBOutlet var topScores : [UILabel]!
    
    @IBAction func action(_ sender: LGButton){
        print("salam \(sender.tag)")
        self.choiceButtonPressed(tag : sender.tag)
    }
    
    @IBAction func restart(_ sender: Any) {
        self.restartExtension(sender)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        HeartController.initImageView(springImageView: self.heartImageView)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        musicController?.fadeOut()
    }
    
    func updatePoints(number : Int){
        pointCounter += number
        if pointCounter < 0{
            self.pointCounter = 0
        }
        self.pointLabel.text = String(self.pointCounter)
    }
    
    func initHealthBarAndHighScore() {
        HealthBarSetup.setup()
        healthBar.setProgress(progress: 0.0, animated: true)
        
        highscoreSpringView.clipsToBounds = true
        highscoreSpringView.layer.cornerRadius = 20
        Pastel.startPastel(view: highscoreSpringView, color: "analogous")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Scoreboard"{
            let destinySegue = segue.destination as! ScoresTableViewController
            destinySegue.scoreArray = self.scoreArray
        }
    }
    
    @IBAction func unwindToThisView(sender: UIStoryboardSegue) {
            scoreMode = true
    }
    
    
    
}


