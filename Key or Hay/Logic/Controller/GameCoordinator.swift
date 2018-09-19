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
        pastel = Pastel.startPastel(view: self.view, color : "normal")
        self.nameField.delegate = self
        
        self.scoreArray = Array(Set(self.scoreArray))
        
        initHealthBarAndHighScore()
        hideAll()
        
        
        self.gamePrepController = GamePrepController(self, preparationTime)
        
        self.timeController = TimeController(self, timeToPlay: gameLenght)
        
        self.cardPointController = CardPointController(gameView : self, timeController: self.timeController!)
        
        self.scoreNetworkController = ScoreNetworkController(delegate : nil)
        
        self.musicController = MusicController()
        
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
        healtBarSpringView.isHidden = true
        pointLabel.isHidden = true
        leftButtonSpringView.isHidden = true
        midButtonSpringView.isHidden = true
        rightButtonSpringView.isHidden = true
        highscoreSpringView.isHidden = true
        inGameRestartButton.isHidden = true
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
        achievedScore.text = "Dein Score: \(String(pointCounter))"
    }
    
    func speedUp(){
        print(healthBar.progressValue)
        switch healthBar.progressValue {
        case 0.0 ... 0.2:
            self.healthBar.barColor = UIColor.flatRed()
            self.heartImageView.duration = 0.2
            self.pastel?.animationDuration = 0.2
        case 0.2 ... 0.5:
            self.healthBar.barColor = UIColor.flatRed()
            self.heartImageView.duration = 0.3
            self.pastel?.animationDuration = 1.0
        case 0.5 ... 0.8:
            self.healthBar.barColor = UIColor.flatRed()
            self.heartImageView.duration = 0.5
            self.pastel?.animationDuration = 1.5
        case 0.8 ... 1.0:
            self.healthBar.barColor = UIColor.flatRed()
            self.heartImageView.duration = 0.8
            self.pastel?.animationDuration = 2.0
        default:
            break
        }
    }
    
    
    
}
