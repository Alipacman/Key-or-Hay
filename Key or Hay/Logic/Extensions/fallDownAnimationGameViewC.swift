//
//  fallDownAnimationGameViewC.swift
//  Key or Hay
//
//  Created by Ali Ebrahimi Pourasad on 12.09.18.
//  Copyright © 2018 Ali Ebrahimi Pourasad. All rights reserved.
//

import Foundation
import Spring

extension GameView{
    
    func allFallDownAnimation(){
        falldown(obj : leftButtonSpringView)
        falldown(obj : rightButtonSpringView)
        falldown(obj : midButtonSpringView)
        falldown(obj : healtBarSpringView)
        falldown(obj : healthSpringView)
        falldown(obj : pointLabel)
        falldown(obj : leftButtonSpringView)
        falldown(obj : leftButtonSpringView)
        falldownHide(obj : zlSpringView)
    }
    
    func falldown(obj : Springable){
        obj.animation = "fall"
        obj.force = 1.0
        obj.damping = 0.4
        obj.duration = 1.5
        obj.rotate = 3.2
        obj.animate()
    }
    func falldownHide(obj : Springable){
        obj.animation = "fall"
        obj.force = 1.0
        obj.damping = 0.4
        obj.duration = 2.0
        obj.rotate = 3.2
        obj.animateNext {
            self.hideAll()
            self.highscoreFallDown()
            
        }
    }
    func highscoreFallDown(){
        highscoreSpringView.isHidden = false
        highscoreSpringView.animation = "squeezeDown"
        highscoreSpringView.force = 1.5
        highscoreSpringView.damping = 0.7
        highscoreSpringView.rotate = 3.2
        highscoreSpringView.scaleX = 2.0
        highscoreSpringView.scaleY = 4.0
        highscoreSpringView.animate()
    }
}
