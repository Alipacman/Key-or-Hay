//
//  GameViewController.swift
//  Key or Hay
//
//  Created by Ali Ebrahimi Pourasad on 14.08.18.
//  Copyright © 2018 Ali Ebrahimi Pourasad. All rights reserved.
//

import Foundation

extension GameView{
    
    override func viewDidLoad() {
        cardContainer.isHidden = true
        imageContainer.isHidden = true
        pointTimeStack.isHidden = true
        self.gamePrepController = GamePrepController(self, preparationTime)
        self.gamePrepController!.prepareStart()
        
        self.timeController = TimeController(self, timeToPlay: gameLenght)
        self.cardPointController = CardPointController(gameView : self, timeController: self.timeController!)
        
        super.viewDidLoad()
    }
    
    
    func preparationDone(_ sender: GamePrepController) {
        print("prepartion done, starting game...")
        startGame()
    }
    
    func startGame(){
        self.pointTimeStack.isHidden = false
        timeController!.startTimer()
        cardPointController!.spawnCard()
    }
    
    func pressedButton(tag : Int){
        cardPointController!.buttonPressed(buttonNumber: tag)
    }
    
    func timeFinished(_ sender: TimeController) {
        self.performSegue(withIdentifier: "highscore", sender: self)
    }
}
