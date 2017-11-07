//
//  GameAnimations.swift
//  Key or Hay
//
//  Created by Ali Ebrahimi Pourasad on 01.11.17.
//  Copyright © 2017 Ali Ebrahimi Pourasad. All rights reserved.
//

import Foundation
import UIKit

extension GameController{
    
    
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
    
    
    
    func startdown(){
        timer = Timer.scheduledTimer(timeInterval: 1.4, target: self, selector: #selector(self.downCounter), userInfo: nil, repeats: true)
    }
    
    @objc func downCounter(){
        
        self.count = self.count - 1
        DispatchQueue.main.async {
            self.StartNumberLabel.text = "\(self.self.count)"
        }
    }
    
    
    
    
    
    
    func animatedSlideoutUp (card : UIView){

        let translateTransform = CGAffineTransform(translationX: 0, y: -600)
 
        
        UIView.animate(withDuration: 0.2, delay: 0, options: [.curveEaseIn] , animations: {
            card.transform = translateTransform
        }, completion:{ _ in
            card.removeFromSuperview()
        })
    }
    func animatedSlideoutRight (card : UIView){
        
        let rotateTransfrom = CGAffineTransform(rotationAngle: 25)
        let translateTransform = CGAffineTransform(translationX: 520, y: 0)
        let comboTransform = translateTransform.concatenating(rotateTransfrom)
        
        UIView.animate(withDuration: 0.2, delay: 0, options: [.curveEaseIn] , animations: {
            card.transform = comboTransform
        }, completion:{ _ in
            card.removeFromSuperview()
        })
    }
    
    func animatedSlideoutLeft (card : UIView){
        
        let rotateTransfrom = CGAffineTransform(rotationAngle: -25)
        let translateTransform = CGAffineTransform(translationX: -520, y: 0)
        let comboTransform = translateTransform.concatenating(rotateTransfrom)
        
        UIView.animate(withDuration: 0.2, delay: 0, options: [.curveEaseIn] , animations: {
            card.transform = comboTransform
        }, completion:{ _ in
            card.removeFromSuperview()
        })
    }
}
