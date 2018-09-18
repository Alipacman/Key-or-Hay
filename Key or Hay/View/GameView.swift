//
//  GameController.swift
//  Key or Hay
//
//  Created by Ali Ebrahimi Pourasad on 31.10.17.
//  Copyright © 2017 Ali Ebrahimi Pourasad. All rights reserved.
//

import UIKit


class GameView: UIViewController, PreparationDelegate, TimerDelegate{
    
    
    var startController : StartController?
    var cardPointController : CardPointController?
    var timeController : TimeController?
    
    var preparationTime = 4
    var gameLenght = 10.0
    
    @IBOutlet weak var startNumberView: UIView!
    @IBOutlet weak var startNumberLabel: UILabel!
    
    @IBOutlet weak var cardContainer: UIView!
    @IBOutlet weak var imageContainer: UIImageView!
    
    @IBOutlet weak var pointTimeStack: UIStackView!
    @IBOutlet weak var pointCounter: UILabel!
    @IBOutlet weak var timeCounter: UILabel!
    
    @IBOutlet weak var leftButtonView: UIView!
    @IBOutlet weak var centralButtonView: UIView!
    @IBOutlet weak var rightButtonView: UIView!
    
    @IBAction func buttonClicked(sender: UIButton){
        self.pressedButton(tag : sender.tag)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let points = Int(self.pointCounter.text!)
        let destinySegue = segue.destination as! HighScoreViewController
        destinySegue.userScore = points!
    }
    
    
    
}


