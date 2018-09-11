//
//  StartAnimation.swift
//  Key or Hay
//
//  Created by Ali Ebrahimi Pourasad on 13.08.18.
//  Copyright © 2018 Ali Ebrahimi Pourasad. All rights reserved.
//

import Foundation
import UIKit

extension GamePrepController {
    
    //TODO: Nice Spring animation
    func StartCountDown(){
        print("starting Countdown")
        
//        countdownLable
    }
    
    func countTime(){
        timer = Timer.scheduledTimer(timeInterval: 1.4, target: self, selector: #selector(self.changeTimeLable), userInfo: nil, repeats: true)
    }
    
    @objc func changeTimeLable(){
        self.startSecond = self.startSecond - 1
        DispatchQueue.main.async {
            self.gameView!.countdownLable.text = "\(self.startSecond)"
        }
    }
    
}
