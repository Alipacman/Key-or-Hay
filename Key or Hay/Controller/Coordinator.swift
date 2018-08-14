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
        self.startController?.prepareStart()
        
        self.cardPointController = CardPointController(self)
        
        self.timeController = TimeController(self)
        super.viewDidLoad()
    }
    
    
    func preparationDone(_ sender: StartController) {
        print("prepartion done, starting game...")
        startGame()
    }
    
    func startGame(){
        self.pointTimeStack.isHidden = false
        timeController?.startTimer()
        cardPointController?.spawnCard()
    }
    
    func pressedLeftButton(_ sender: GameView) {
        cardPointController?.buttonPressed(buttonNumber: 0)
    }
    
    func pressedCenteredButton(_ sender: GameView) {
        cardPointController?.buttonPressed(buttonNumber: 1)
    }
    
    func pressedRightButton(_ sender: GameView) {
        cardPointController?.buttonPressed(buttonNumber: 2)
    }
    
    func timeFinieshed(_ sender: TimeController) {
        self.performSegue(withIdentifier: "highscore", sender: self)
    }
}
