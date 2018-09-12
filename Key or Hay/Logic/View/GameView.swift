//
//  GameController.swift
//  Key or Hay
//
//  Created by Ali Ebrahimi Pourasad on 31.10.17.
//  Copyright © 2017 Ali Ebrahimi Pourasad. All rights reserved.
//

import UIKit
import Spring
import Hero
import ZLSwipeableViewSwift
import AMProgressBar
import ChameleonFramework
import LGButton

class GameView: UIViewController, PreparationDelegate, TimerDelegate{
    
    var counter = 0
    
    var gamePrepController : GamePrepController?
    var cardPointController : CardPointController?
    var timeController : TimeController?
    
    var preparationTime = 4
    var gameLenght = 10.0
    var pointCounter = 0
    
    var colorArray = NSArray(ofColorsWith: ColorScheme.analogous, using: UIColor.flatPurple(), withFlatScheme: true)
    
    @IBOutlet weak var zlSpringView: SpringView!
    @IBOutlet weak var zLSwipeableView: ZLSwipeableView!
    
    @IBOutlet weak var healtBarSpringView: SpringView!
    @IBOutlet weak var healthBar: AMProgressBar!
    
    @IBOutlet weak var countdownLable: SpringLabel!
    @IBOutlet weak var pointLabel: SpringLabel!
    
    @IBOutlet weak var healthSpringView: SpringImageView!
    
    @IBOutlet weak var leftButtonSpringView: SpringView!
    @IBOutlet weak var midButtonSpringView: SpringView!
    @IBOutlet weak var rightButtonSpringView: SpringView!
    
    @IBOutlet weak var highscoreSpringView: SpringView!
    
    
    
    
    @IBAction func action(_ sender: LGButton){
        print("salam \(sender.tag)")
        self.choiceButtonPressed(tag : sender.tag)
    }
    
    @IBAction func restart(_ sender: Any) {
        restart()
    }
    
//    umschreiben für tabelle
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let destinySegue = segue.destination as! HighScoreViewController
//        destinySegue.userScore = pointCounter
//    }
    
    override func viewWillAppear(_ animated: Bool) {
        HeartController.initImageView(springImageView: self.healthSpringView)
    }
    
    func updatePoints(number : Int){
        pointCounter += number
        self.pointLabel.text = String(self.pointCounter)
    }
    
    func initHealthBarAndHighScore() {
        HealthBarSetup.setup()
        healthBar.setProgress(progress: 0.0, animated: true)
        
        highscoreSpringView.clipsToBounds = true
        highscoreSpringView.layer.cornerRadius = 20
        Pastel.startPastel(view: highscoreSpringView, color: "analogous")
    }
    
}


