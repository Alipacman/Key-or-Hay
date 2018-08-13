//
//  GameController.swift
//  Key or Hay
//
//  Created by Ali Ebrahimi Pourasad on 31.10.17.
//  Copyright © 2017 Ali Ebrahimi Pourasad. All rights reserved.
//

import UIKit


class GameController: UserInteractionDelegate, PreparationDelegate {
    
    
    var gameView : GameView?
    var startController : StartController?
    
    var pressCounter = 0
    var startSecond = 4
    var timer = Timer()
    var timestore = 0.0
    
    var imageCounter = 0
    var pictureArray = [UIView]()
    
    var pointCounter = 0
    var userGuess = 0
    var solution = 0
    
    
    
    func gameViewLoaded(_ view : GameView ){
        gameView = view
        gameView?.delegate = self
        startController = StartController(gameView! , startSecond)
        startController?.delegate = self
        startController.prepareStart()
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
    
    
    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinysugue = segue.destination as! HighScoreViewController
            destinysugue.userScore = pointCounter
        }
    
// Handels Counting
    func scheduledTimerWithTimeInterval(){
        // Scheduling timer to Call the function "updateCounting" with the interval of 1 seconds
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(self.updateCounting), userInfo: timestore, repeats: true)
    }
    
    @objc func updateCounting(){
        gameView?.timeCounter.text = String(timer.userInfo as! Double)
    }
    
    func addCardToView(card : Card) {
        gameView!.view.addSubview(card)
        gameView!.view.sendSubview(toBack: card)
        card.setupContainer(cardToUse: card , PicToUse :pic)
    }
    
    func prepare(for segue: UIStoryboardSegue, sender: GameView) {
        let destinysugue = segue.destination as! HighScoreViewController
        destinysugue.userScore = pointCounter
    }
    
    
    func startGame(){
        gameView!.PointCounter.isHidden = false
        gameView!.timeCounter.isHidden = false
        scheduledTimerWithTimeInterval()
        createCard()
    }
    
    func preparationDone(_ sender: StartController) {
        startGame()
    }
    
    
    func pressedLeftButton(_ sender: GameView) {
    }
    
    func pressedRightButton(_ sender: GameView) {
    }
    
    func pressedCenteredButton(_ sender: GameView) {
    }
    
}


