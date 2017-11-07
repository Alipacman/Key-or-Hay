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
    
    
    
    func animatedSlideoutUp (card : UIView){

        userGuess = 1
        let translateTransform = CGAffineTransform(translationX: 0, y: -600)
 
        
        UIView.animate(withDuration: 0.2, delay: 0, options: [.curveEaseIn] , animations: {
            card.transform = translateTransform
        }, completion:{ _ in
            card.removeFromSuperview()
        })
    }
    func animatedSlideoutRight (card : UIView){
        userGuess = 2
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
        userGuess = 0
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
