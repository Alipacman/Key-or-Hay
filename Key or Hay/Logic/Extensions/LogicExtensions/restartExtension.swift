//
//  restartExtension.swift
//  Key or Hay
//
//  Created by Ali Ebrahimi Pourasad on 19.09.18.
//  Copyright © 2018 Ali Ebrahimi Pourasad. All rights reserved.
//

import Foundation
import UIKit

extension GameView{
    
    func restartExtension(_ sender : Any){
        initStartState()
        if (sender as AnyObject).tag == 1{
            self.musicController?.fadeOut()
            self.submitScore()
            self.highscoreSpringView.animation = "fadeOut"
            self.highscoreSpringView.duration = 1.0
            self.highscoreSpringView.animateNext {
                self.highscoreSpringView.isHidden = true
                self.pointCounter = 0
                self.pointLabel.text = String(0)
                self.gamePrepController!.prepareStart()
            }
        }
        else{
            self.heartImageView.image = #imageLiteral(resourceName: "redHeart")
            self.musicController?.fadeOut()
            self.allFallDownAnimation()
            self.healthBar.progressValue = 0.0
            self.inGameRestartButton.isHidden = true
            self.pointCounter = 0
            self.pointLabel.text = String(0)
            self.timeController!.stopTimer()
            self.gamePrepController!.prepareStart()
        }
    }
    
}
