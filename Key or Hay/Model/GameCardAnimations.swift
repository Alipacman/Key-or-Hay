//
//  GameAnimations.swift
//  Key or Hay
//
//  Created by Ali Ebrahimi Pourasad on 01.11.17.
//  Copyright © 2017 Ali Ebrahimi Pourasad. All rights reserved.
//

import Foundation
import UIKit

extension Card{
    
    func animatedSlideoutUp (){
        let translateTransform = CGAffineTransform(translationX: 0, y: -600)
 
        UIView.animate(withDuration: 0.2, delay: 0, options: [.curveEaseIn] , animations: {
            self.transform = translateTransform
        }, completion:{ _ in
            self.removeFromSuperview()
        })
    }
    
    func animatedSlideoutRight (){
        let rotateTransfrom = CGAffineTransform(rotationAngle: 25)
        let translateTransform = CGAffineTransform(translationX: 520, y: 0)
        let comboTransform = translateTransform.concatenating(rotateTransfrom)
        
        UIView.animate(withDuration: 0.2, delay: 0, options: [.curveEaseIn] , animations: {
            self.transform = comboTransform
        }, completion:{ _ in
            self.removeFromSuperview()
        })
    }
    
    func animatedSlideoutLeft (){
        let rotateTransfrom = CGAffineTransform(rotationAngle: -25)
        let translateTransform = CGAffineTransform(translationX: -520, y: 0)
        let comboTransform = translateTransform.concatenating(rotateTransfrom)
        
        UIView.animate(withDuration: 0.2, delay: 0, options: [.curveEaseIn] , animations: {
            self.transform = comboTransform
        }, completion:{ _ in
            self.removeFromSuperview()
        })
    }
}
