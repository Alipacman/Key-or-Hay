//
//  prepAnimations.swift
//  Key or Hay
//
//  Created by Ali Ebrahimi Pourasad on 11.09.18.
//  Copyright © 2018 Ali Ebrahimi Pourasad. All rights reserved.
//

import Foundation

extension GamePrepController{
    
    func startBoardPrepAnimation(){
        gameView?.leftButtonSpringView.isHidden = false
        gameView?.leftButtonSpringView.animation = "squeezeRight"
        gameView?.leftButtonSpringView.duration = 1.4
        gameView?.leftButtonSpringView.animate()
        
        gameView?.rightButtonSpringView.isHidden = false
        gameView?.rightButtonSpringView.animation = "squeezeLeft"
        gameView?.rightButtonSpringView.duration = 1.0
        gameView?.rightButtonSpringView.animateNext {
            self.gameView?.midButtonSpringView.isHidden = false
            self.gameView?.midButtonSpringView.animation = "fadeInUp"
            self.gameView?.midButtonSpringView.damping = 0.4
            self.gameView?.midButtonSpringView.duration = 1.0
            self.gameView?.midButtonSpringView.animateNext {
                
                self.gameView?.healtBarSpringView.isHidden = false
                self.gameView?.healtBarSpringView.animation = "slideDown"
                self.gameView?.healtBarSpringView.duration = 1.0
                self.gameView?.healtBarSpringView.animate()
                
                self.gameView?.healthSpringView.isHidden = false
                self.gameView?.healthSpringView.animation = "slideDown"
                self.gameView?.healthSpringView.duration = 1.0
                self.gameView?.healthSpringView.animate()
                
                self.gameView?.pointLabel.isHidden = false
                self.gameView?.pointLabel.animation = "zoomIn"
                self.gameView?.pointLabel.duration = 1.0
                self.gameView?.pointLabel.animate()
            }
        }
    }
    
    func startCountDown(){
        print("starting Countdown")
        print(counter)
        if counter > 0{
            self.gameView?.countdownLable.isHidden = false
        }
        else{
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                self.startBoardPrepAnimation()
            })
        }
        gameView?.countdownLable.text = String(4 - counter)
        gameView?.countdownLable.animation = "squeezeLeft"
        gameView?.countdownLable.curve = "easeInExpo"
        gameView?.countdownLable.y = 2.3
        gameView?.countdownLable.rotate = 2.5
        gameView?.countdownLable.damping = 0.7
        gameView?.countdownLable.velocity = 0.5
        gameView?.countdownLable.duration = 1.0
        gameView?.countdownLable.animateNext {
            self.gameView?.countdownLable.animation = "zoomOut"
            self.gameView?.countdownLable.animateNext {
                self.gameView?.countdownLable.isHidden = true
                self.counter += 1
                self.gameView?.countdownLable.animateNext {
                    if self.counter <= 3 {
                        self.startCountDown()
                    }
                    else{
                        self.delegate?.preparationDone(self)
                    }
                }
            }
        }
    }
}
