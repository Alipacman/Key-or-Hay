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
        
        let translateTransform = CGAffineTransform(translationX: 500, y: 0)
        let scaleTransform = CGAffineTransform(scaleX: 2.0, y: 2.0)
        UIView.animate(withDuration: 1.5, delay: 0.1, options: [.curveEaseIn, .repeat ] , animations: {
            UIView.setAnimationRepeatCount(3)
            self.gameView!.startNumberView.transform = translateTransform
            self.countTime()
            print("animation durchlauf")
            UIView.animate(withDuration: 1.5, delay: 1, options: [.curveEaseIn, .repeat ], animations: {
                UIView.setAnimationRepeatCount(3)
                self.gameView!.startNumberView.transform = scaleTransform
            }, completion: { _ in
                self.countDownFinished()
            })
        },completion: nil)
    }
    
    func countTime(){
        timer = Timer.scheduledTimer(timeInterval: 1.4, target: self, selector: #selector(self.changeTimeLable), userInfo: nil, repeats: true)
    }
    
    @objc func changeTimeLable(){
        self.startSecond = self.startSecond - 1
        DispatchQueue.main.async {
            self.gameView!.startNumberLabel.text = "\(self.startSecond)"
        }
    }
    
}
