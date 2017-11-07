//
//  GameExpension.swift
//  Key or Hay
//
//  Created by Ali Ebrahimi Pourasad on 01.11.17.
//  Copyright © 2017 Ali Ebrahimi Pourasad. All rights reserved.
//

import Foundation
import UIKit

extension GameController {
    

    func gameStart(){
        PointCounter.isHidden = false
        timeCounter.isHidden = false
        createCard()
    }
    
    func start(){
        let translateTransform = CGAffineTransform(translationX: 500, y: 0)
        let scaleTransform = CGAffineTransform(scaleX: 2.0, y: 2.0)
        UIView.animate(withDuration: 1.5, delay: 0.1, options: [.curveEaseIn, .repeat ] , animations: {
            UIView.setAnimationRepeatCount(3)
            self.StartNumberView.transform = translateTransform
            self.startdown()
            UIView.animate(withDuration: 1.5, delay: 1, options: [.curveEaseIn, .repeat ], animations: {
                UIView.setAnimationRepeatCount(3)
                self.StartNumberView.transform = scaleTransform
            }, completion: { _ in
                self.downCounter()
                self.gameStart()
                self.StartNumberView.isHidden = true
            })
        },completion: nil)
        
    }
    
    func startAfterTime(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: {
            self.start()
        })
    }
    
    func startdown(){
        timer = Timer.scheduledTimer(timeInterval: 1.4, target: self, selector: #selector(self.downCounter), userInfo: nil, repeats: true)
    }
    
    @objc func downCounter(){
        
        self.startSecond = self.startSecond - 1
        DispatchQueue.main.async {
            self.StartNumberLabel.text = "\(self.self.startSecond)"
        }
    }

    
    
    
}
