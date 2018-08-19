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
    
    
    init(_ gameView : GameView, _ startSecond: Int) {
        self.gameView = gameView
        self.delegate = gameView
        self.startSecond = startSecond
        print("init StartController")
    }
    
    func prepareStart() {
        print("prepStarted")
        gameView!.imageContainer.isHidden = true
        gameView!.pointTimeStack.isHidden = true

        self.prepareAsyncCountDown()
    }
    
    func countDownFinished(){
        print("countdownFinished")
     //   self.downCounter() why?
        gameView!.startNumberView.isHidden = true
        delegate?.preparationDone(self)
    }
 
    
//    time handler of countdown
    
    func prepareAsyncCountDown(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: {
            self.StartCountDown()
        })
    }
    func startdown(){
        timer = Timer.scheduledTimer(timeInterval: 1.4, target: self, selector: #selector(self.downCounter), userInfo: nil, repeats: true)
    }
    
    @objc func downCounter(){
        self.startSecond = self.startSecond - 1
        DispatchQueue.main.async {
            self.gameView!.startNumberLabel.text = "\(self.startSecond)"
        }
    }
    
}
