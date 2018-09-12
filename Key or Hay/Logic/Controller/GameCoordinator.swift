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
        Pastel.startPastel(view: self.view, color : "normal")
        initHealthBarAndHighScore()
        hideAll()
        self.gamePrepController = GamePrepController(self, preparationTime)
        
        self.gamePrepController!.prepareStart()
        self.timeController = TimeController(self, timeToPlay: gameLenght)
        self.cardPointController = CardPointController(gameView : self, timeController: self.timeController!)
        
        super.viewDidLoad()
    }
    
    
    func hideAll(){
        zlSpringView.isHidden = true
        healthSpringView.isHidden = true
        healtBarSpringView.isHidden = true
        pointLabel.isHidden = true
        leftButtonSpringView.isHidden = true
        midButtonSpringView.isHidden = true
        rightButtonSpringView.isHidden = true
        highscoreSpringView.isHidden = true
    }
    
    func preparationDone(_ sender: GamePrepController) {
        print("prepartion done, starting game...")
        startGame()
    }
    
    func startGame(){
        zlSpringView.isHidden = false
        zlSpringView.animation = "zoomIn"
        zlSpringView.rotate = 1.6
        zlSpringView.force = 1.5
        zlSpringView.animateNext {
            self.timeController!.startTimer()
        }
    }
    
    func choiceButtonPressed(tag : Int){
        cardPointController!.buttonPressed(buttonNumber: tag)
    }
    
    func gametimeFinished(_ sender: TimeController) {
        allFallDownAnimation()
//        self.performSegue(withIdentifier: "highscore", sender: self)
    }
    
    func restart() {
        self.highscoreSpringView.animation = "fadeOut"
        self.highscoreSpringView.duration = 1.0
        self.highscoreSpringView.animateNext {
            self.highscoreSpringView.isHidden = true
            self.pointCounter = 0
            self.pointLabel.text = String(0)
            self.gamePrepController!.prepareStart()
        }
    }
    
}
