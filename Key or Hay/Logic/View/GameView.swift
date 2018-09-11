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
import NumberMorphView
import AMProgressBar
import ChameleonFramework

class GameView: UIViewController, PreparationDelegate, TimerDelegate{
    
    
    var gamePrepController : GamePrepController?
    var cardPointController : CardPointController?
    var timeController : TimeController?
    
    var preparationTime = 4
    var gameLenght = 10.0
    var pointCounter = 0
    
    var colorArray = NSArray(ofColorsWith: ColorScheme.analogous, using: UIColor.flatPurple(), withFlatScheme: true)
    
    @IBOutlet weak var zLSwipeableView: ZLSwipeableView!
    @IBOutlet weak var healthBar: AMProgressBar!
    
    @IBOutlet weak var countdownLable: UILabel!
    @IBOutlet weak var pointLabel: UILabel!
    
    @IBOutlet weak var leftButtonView: UIView!
    @IBOutlet weak var centralButtonView: UIView!
    @IBOutlet weak var rightButtonView: UIView!
    
    @IBOutlet weak var healthSpringView: SpringImageView!
    
    
    @IBAction func buttonClicked(sender: UIButton){
        self.choiceButtonPressed(tag : sender.tag)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinySegue = segue.destination as! HighScoreViewController
        destinySegue.userScore = pointCounter
    }
    
    override func viewWillAppear(_ animated: Bool) {
        HeartController.initImageView(springImageView: self.healthSpringView)
    }
    
    func updatePoints(number : Int){
        pointCounter += number
        self.pointLabel.text = String(self.pointCounter)
    }
    
    func initHealthBar() {
        HealthBarSetup.setup()
        healthBar.setProgress(progress: 0.0, animated: true)
    }
    
}


