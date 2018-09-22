//
//  TimeController.swift
//  Key or Hay
//
//  Created by Ali Ebrahimi Pourasad on 14.08.18.
//  Copyright © 2018 Ali Ebrahimi Pourasad. All rights reserved.
//

import Foundation
import UIKit

class TimeController {
    
    var gameView : GameView?
    var delegate : TimerDelegate?
    var timeToPlay : Double
    var timer : Timer?
    
    var speedCounter = 0
    
    var timePassed = 0.0
    
    init(_ gameView : GameView, timeToPlay : Double) {
        self.gameView = gameView
        self.timeToPlay = timeToPlay
        self.delegate = gameView
    }
    
    // Handels Counting
    func startTimer(){
        // Scheduling timer to Call the function "updateCounting" with the interval of 0.1 seconds
        speedCounter = 0
        if timer == nil {
            timer = Timer.scheduledTimer(timeInterval: 0.05, target: self, selector: #selector(self.updateCounting), userInfo: nil, repeats: true)
        }
    }
    
    @objc func updateCounting(){
        timePassed += 0.05
        self.gameView?.healthBar.setProgress(progress: CGFloat(self.timePassed/self.timeToPlay), animated: true)
        speedUp()
        if timePassed >= timeToPlay{
            delegate?.gametimeFinished(self)
            stopTimer()
        }
    }
    
    func AddbonusTime(timeToAdd : Double) {
        if (timePassed > 0.5 ){
            timePassed -= timeToAdd
        }
    }
    
    func stopTimer(){
        if timer != nil {
            self.timer!.invalidate()
            self.timer = nil
            
            timePassed = 0.0
        }
    }
}
