//
//  GameController.swift
//  Key or Hay
//
//  Created by Ali Ebrahimi Pourasad on 31.10.17.
//  Copyright © 2017 Ali Ebrahimi Pourasad. All rights reserved.
//

import UIKit


class GameController: UserInteractionDelegate, PreparationDelegate {
    
    var gameView : GameView
    var startController : StartController?
    var cardPointController : CardPointController?
    
    var pressCounter = 0
    var startSecond = 4
    
    var time = 0.0
    
    var gameLengh = 10.0
    var userGuess = 0
    
    
    init(_ mainView : GameView) {
        self.gameView = mainView
        print("init Coordinator")
    }
    
    func gameViewLoaded(_ view : GameView ){
        self.startController = StartController(gameView, startSecond)
        self.startController?.delegate = self
        self.startController?.prepareStart()
        print("starting prep")
        self.cardPointController = CardPointController(gameView)
    }
    
    func preparationDone(_ sender: StartController) {
        startGame()
    }
    
    func startGame(){
        gameView.pointTimeStack.isHidden = false
        scheduledTimerWithTimeInterval()
        cardPointController?.spawnCard()
    }
    
    func endGame() {
        if (time > 10.0){
            gameView.performSegue(withIdentifier: "highscore", sender: gameView)
        }
        else{
            cardPointController?.spawnCard()
        }
    }
    
    
    
    func prepare(for segue: UIStoryboardSegue, sender: GameView) {
        let points = Int(gameView.pointCounter.text!)
        let destinysugue = segue.destination as! HighScoreViewController
        destinysugue.userScore = points!
    }
    
    
    // Handels Counting
    func scheduledTimerWithTimeInterval(){
        // Scheduling timer to Call the function "updateCounting" with the interval of 1 seconds
        Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(self.updateCounting), userInfo: time, repeats: true)
    }
    
    @objc func updateCounting(){
        gameView.timeCounter.text = String(time)
    }
    
    func pressedLeftButton(_ sender: GameView) {
        cardPointController?.buttonPressed(buttonNumber: 0)
        endGame()
    }
    
    func pressedCenteredButton(_ sender: GameView) {
        cardPointController?.buttonPressed(buttonNumber: 1)
        endGame()
    }
    
    func pressedRightButton(_ sender: GameView) {
        cardPointController?.buttonPressed(buttonNumber: 2)
        endGame()
    }
    
    
    
    
}


