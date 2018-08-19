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
        self.startController = StartController(self, preparationTime)
        self.startController!.prepareStart()
        
        self.cardPointController = CardPointController(self)
        
        self.timeController = TimeController(self, timeToPlay: gameLenght)
        super.viewDidLoad()
    }
    
    
    func preparationDone(_ sender: StartController) {
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
