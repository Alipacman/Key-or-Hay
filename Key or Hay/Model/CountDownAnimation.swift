//
//  StartAnimation.swift
//  Key or Hay
//
//  Created by Ali Ebrahimi Pourasad on 13.08.18.
//  Copyright © 2018 Ali Ebrahimi Pourasad. All rights reserved.
//

import Foundation

extension StartController {

    //TODO: Nice Spring animation
    func StartCountDown(){
    let translateTransform = CGAffineTransform(translationX: 500, y: 0)
    let scaleTransform = CGAffineTransform(scaleX: 2.0, y: 2.0)
    UIView.animate(withDuration: 1.5, delay: 0.1, options: [.curveEaseIn, .repeat ] , animations: {
        UIView.setAnimationRepeatCount(3)
        gameView.StartNumberView.transform = translateTransform
        self.startdown()
        UIView.animate(withDuration: 1.5, delay: 1, options: [.curveEaseIn, .repeat ], animations: {
            UIView.setAnimationRepeatCount(3)
            gameView.StartNumberView.transform = scaleTransform
        }, completion: { _ in
            self.countDownFinished()
        })
    },completion: nil)
    
}
    
}
