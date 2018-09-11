//
//  GameViewController.swift
//  Key or Hay
//
//  Created by Ali Ebrahimi Pourasad on 14.08.18.
//  Copyright © 2018 Ali Ebrahimi Pourasad. All rights reserved.
//

import Foundation
import NumberMorphView

extension GameView{
    
    override func viewDidLoad() {
        Pastel.startPastel(view: self.view)
        
        self.gamePrepController = GamePrepController(self, preparationTime)
        self.gamePrepController!.prepareStart()
        
        self.timeController = TimeController(self, timeToPlay: gameLenght)
        self.cardPointController = CardPointController(gameView : self, timeController: self.timeController!)
        
        initHealthBar()
        startGame()
        super.viewDidLoad()
    }
    
    
    func preparationDone(_ sender: GamePrepController) {
        print("prepartion done, starting game...")
        startGame()
    }
    
    func startGame(){
        timeController!.startTimer()
    }
    
    func choiceButtonPressed(tag : Int){
        cardPointController!.buttonPressed(buttonNumber: tag)
    }
    
    func gametimeFinished(_ sender: TimeController) {
        self.performSegue(withIdentifier: "highscore", sender: self)
    }
}
