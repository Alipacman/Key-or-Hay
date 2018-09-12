//
//  GameExpension.swift
//  Key or Hay
//
//  Created by Ali Ebrahimi Pourasad on 01.11.17.
//  Copyright © 2017 Ali Ebrahimi Pourasad. All rights reserved.
//

import Foundation
import UIKit


//Resets the MainView and starts Countdown
class GamePrepController {
    
    var gameView : GameView?
    var delegate : PreparationDelegate?
    
    var startSecond : Int
    var timer = Timer()
    
    var counter = 0
    
    
    init(_ gameView : GameView, _ startSecond: Int) {
        self.gameView = gameView
        self.delegate = gameView
        self.startSecond = startSecond
        print("init StartController")
    }
    
    
    func prepareStart() {
        print("prepStarted")
        counter = 0
        startCountDown()
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
