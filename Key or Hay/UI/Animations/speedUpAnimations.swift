//
//  speedUpAnimations.swift
//  Key or Hay
//
//  Created by Ali Ebrahimi Pourasad on 22.09.18.
//  Copyright © 2018 Ali Ebrahimi Pourasad. All rights reserved.
//

import Foundation
import Spring

extension TimeController{
    
    //    TODO: compress numbers into array
    func speedUp(){
        switch (1.0 - gameView!.healthBar.progressValue) {
        case 0.01 ... 0.3:
            if self.speedCounter == 2{
                gameView!.healthBar.barColor = UIColor.flatOrangeColorDark()
                gameView!.pastel?.removeFromSuperview()
                gameView!.pastel = Pastel.startPastel(view: gameView!.view, color: "analogous_bright", speed : 0.2)
                
                gameView!.heartImageView.animation = "pop"
                gameView!.heartImageView.force = 0.6
                gameView!.heartImageView.duration = 0.5
                gameView!.heartImageView.repeatCount = 1000
                
                gameView!.healthBarSpringView.animation = "swing"
                gameView!.healthBarSpringView.force = 0.6
                gameView!.healthBarSpringView.damping = 0.8
                gameView!.healthBarSpringView.duration = 0.6
                gameView!.healthBarSpringView.repeatCount = 1000
                
                //                gameView!.pointLabel.animation = "wobble"
                //                gameView!.pointLabel.force = 0.6
                //                gameView!.pointLabel.duration = 0.5
                //                gameView!.pointLabel.repeatCount = 1000
                
                gameView!.pointLabel.animate()
                gameView!.healthBarSpringView.animate()
                gameView!.heartImageView.animate()
                speedCounter += 1
            }
        case 0.3 ... 0.6:
            if self.speedCounter == 1{
                gameView!.healthBar.barColor = UIColor.flatYellow()
                gameView!.pastel?.removeFromSuperview()
                gameView!.pastel? = Pastel.startPastel(view: gameView!.view, color: "analogous", speed : 0.4)
                
                gameView!.heartImageView.animation = "pop"
                gameView!.heartImageView.force = 0.4
                gameView!.heartImageView.duration = 0.5
                gameView!.heartImageView.repeatCount = 1000
                
                gameView!.healthBarSpringView.animation = "swing"
                gameView!.healthBarSpringView.force = 0.4
                gameView!.healthBarSpringView.duration = 0.9
                gameView!.healthBarSpringView.repeatCount = 1000
                
                //                gameView!.pointLabel.animation = "wobble"
                //                gameView!.pointLabel.force = 0.4
                //                gameView!.pointLabel.duration = 1.0
                //                gameView!.pointLabel.repeatCount = 1000
                
                gameView!.pointLabel.animate()
                gameView!.healthBarSpringView.animate()
                gameView!.heartImageView.animate()
                gameView!.pastel?.startAnimation()
                speedCounter += 1
            }
            
        case 0.6 ... 1.0  :
            if self.speedCounter == 0{
                gameView!.startStateOfAnimations()
                speedCounter += 1
            }
        default:
            break
        }
    }
}
