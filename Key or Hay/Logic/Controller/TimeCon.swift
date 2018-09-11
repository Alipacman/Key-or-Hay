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
    
    var timePassed = 0.0
    var timer = Timer()
    
    init(_ gameView : GameView, timeToPlay : Double) {
        self.gameView = gameView
        self.timeToPlay = timeToPlay
        self.delegate = gameView
    }
    
    // Handels Counting
    func startTimer(){
        // Scheduling timer to Call the function "updateCounting" with the interval of 0.1 seconds
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(self.updateCounting), userInfo: nil, repeats: true)
    }
    
    @objc func updateCounting(){
        timePassed += 0.1
        self.gameView?.healthBar.setProgress(progress: CGFloat(self.timePassed/self.timeToPlay), animated: true)
        if timePassed >= timeToPlay{
            delegate?.gametimeFinished(self)
        }
    }
    
    func AddbonusTime(timeToAdd : Double) {
        if (timePassed > 0.5 ){
            timePassed -= timeToAdd
        }
    }
}
