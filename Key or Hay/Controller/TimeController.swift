//
//  TimeController.swift
//  Key or Hay
//
//  Created by Ali Ebrahimi Pourasad on 14.08.18.
//  Copyright © 2018 Ali Ebrahimi Pourasad. All rights reserved.
//

import Foundation

class TimeController {
    
    var gameview : GameView?
    var delegate : TimerDelegate?
    
    
    var timer = Timer()
    init(_ gameView : GameView) {
        self.gameview = gameView
        self.delegate = gameView
    }
    
    func startTimer() {
        
    }
    // Handels Counting
    func scheduledTimerWithTimeInterval(){
        // Scheduling timer to Call the function "updateCounting" with the interval of 0.1 seconds
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(self.updateCounting), userInfo: time, repeats: true)
    }
    
    @objc func updateCounting(){
        gameview?.timeCounter.text = String(timer.userInfo as! Double)
        print(time)
    }
    
}
