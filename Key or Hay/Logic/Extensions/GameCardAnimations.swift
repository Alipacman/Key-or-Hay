//
//  GameAnimations.swift
//  Key or Hay
//
//  Created by Ali Ebrahimi Pourasad on 01.11.17.
//  Copyright © 2017 Ali Ebrahimi Pourasad. All rights reserved.
//

import Foundation
import UIKit

extension Card {
    
    func animatedSlideoutUp (){
        let translateTransform = CGAffineTransform(translationX: 0, y: -600)
        UIView.animate(withDuration: 0.2, delay: 0, options: [.curveEaseIn] , animations: {
            self.viewContainer?.transform = translateTransform
        }, completion:{ _ in
            self.viewContainer?.removeFromSuperview()
        })
    }
    
    func animatedSlideoutRL(direction : String){
        var rotationAngle : CGFloat = 25
        var translationX : CGFloat = 520
        if (direction == "left"){
            rotationAngle *= -1
            translationX *= -1
        }
        let rotateTransfrom = CGAffineTransform(rotationAngle: rotationAngle)
        let translateTransform = CGAffineTransform(translationX: translationX, y: 0)
        let comboTransform = translateTransform.concatenating(rotateTransfrom)
        
        UIView.animate(withDuration: 0.2, delay: 0, options: [.curveEaseIn] , animations: {
            self.viewContainer?.transform = comboTransform
        }, completion:{ _ in
            self.viewContainer?.removeFromSuperview()
        })
    }
}
