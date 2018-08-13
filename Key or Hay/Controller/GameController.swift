//
//  GameController.swift
//  Key or Hay
//
//  Created by Ali Ebrahimi Pourasad on 31.10.17.
//  Copyright © 2017 Ali Ebrahimi Pourasad. All rights reserved.
//

import UIKit


class GameController: UIViewController, UserInteractionDelegate {
    
    
    var mainView : GameView?
    
    var pressCounter = 0
    var startSecond = 4
    var timer = Timer()
    var timestore = 0.0
    
    var imageCounter = 0
    var pictureArray = [UIView]()
    
    var pointCounter = 0
    var userGuess = 0
    var solution = 0
    
    
    
    override func viewDidLoad() {
        mainView = GameView()
        mainView?.delegate = self
        startAfterTime()
        pictureArray = []
        
        imageContainer2.isHidden = true
        PointCounter.isHidden = true
        timeCounter.isHidden = true
        super.viewDidLoad()
    }
    
    
    func pointSystem(){
        if (userGuess == solution) {
            pointCounter += 1
    }
        else{
            pointCounter -= 1
        }
        PointCounter.text = "Points: \(String(pointCounter))"
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinysugue = segue.destination as! HighScoreViewController
            destinysugue.userScore = pointCounter
        }
    
    func scheduledTimerWithTimeInterval(){
        // Scheduling timer to Call the function "updateCounting" with the interval of 1 seconds
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(self.updateCounting), userInfo: timestore, repeats: true)
    }
    
    @objc func updateCounting(){
        mainView?.timeCounter.text = String(timer.userInfo as! Double)
    }
    
    func addCardToView(card : Card) {
        view.addSubview(card)
        view.sendSubview(toBack: card)
        card.setupContainer(cardToUse: card , PicToUse :pic)
    }
    
    func prepare(for segue: UIStoryboardSegue, sender: GameView) {
        let destinysugue = segue.destination as! HighScoreViewController
        destinysugue.userScore = pointCounter
    }
    
    
    func pressedLeftButton(_ sender: GameView) {
    }
    
    func pressedRightButton(_ sender: GameView) {
    }
    
    func pressedCenteredButton(_ sender: GameView) {
    }
    
}


