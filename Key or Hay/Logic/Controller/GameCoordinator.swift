//
//  GameViewController.swift
//  Key or Hay
//
//  Created by Ali Ebrahimi Pourasad on 14.08.18.
//  Copyright © 2018 Ali Ebrahimi Pourasad. All rights reserved.
//

import Foundation
import UIKit

extension GameView{
    
    override func viewDidLoad() {
        self.navigationController?.navigationBar.isHidden = true
        pastel = Pastel.startPastel(view: self.view, color : "normal", speed: 1.5)
        self.nameField.delegate = self
        
        self.scoreArray = Array(Set(self.scoreArray))
        
        initStartState()
        hideAll()
        
        
        self.gamePrepController = GamePrepController(self, preparationTime)
        
        self.timeController = TimeController(self, timeToPlay: gameLenght)
        
        self.cardPointController = CardPointController(gameView : self, timeController: self.timeController!)
        
        self.scoreNetworkController = ScoreNetworkController(delegate : nil)
        
        self.musicController = MusicController()
        
        startStateOfAnimations()
        
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if !scoreMode{
            self.gamePrepController!.prepareStart()
        }
    }
    
    
    func hideAll(){
        zlSpringView.isHidden = true
        heartImageView.isHidden = true
        healthBarSpringView.isHidden = true
        pointLabel.isHidden = true
        leftButtonSpringView.isHidden = true
        midButtonSpringView.isHidden = true
        rightButtonSpringView.isHidden = true
        highscoreSpringView.isHidden = true
        inGameRestartButton.isHidden = true
        
//        self.buttonRandomMark.isHidden = true
//        self.buttonHusseinFace.isHidden = true
//        self.buttonAliFace.isHidden = true
    }
    
    func preparationDone(_ sender: GamePrepController) {
        print("prepartion done, starting game...")
        inGameRestartButton.isHidden = false
        inGameRestartButton.animation = "fadeIn"
        inGameRestartButton.animate()
        
        startGame()
    }
    
    func startGame(){
        musicController?.playSound(songName: "gameMusic")
        scoreMode = false
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
        self.musicController?.fadeOut()
        self.updateTopScores()
        allFallDownAnimation()
        achievedScore.text = String(pointCounter)
    }
    
    func updatePoints(number : Int){
        pointCounter += number
        if pointCounter < 0{
            self.pointCounter = 0
        }
        self.pointLabel.text = String(self.pointCounter)
    }
    
    func initStartState() {
        HealthBarSetup.setup()
        healthBar.setProgress(progress: 0.0, animated: true)
        
        highscoreSpringView.clipsToBounds = true
        highscoreSpringView.layer.cornerRadius = 20
        Pastel.startPastel(view: highscoreSpringView, color: "normal", speed: 1.5)
        
        startStateOfAnimations()
    }
    
}
