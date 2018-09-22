//
//  startStateOfAnimations.swift
//  Key or Hay
//
//  Created by Ali Ebrahimi Pourasad on 22.09.18.
//  Copyright © 2018 Ali Ebrahimi Pourasad. All rights reserved.
//

import Foundation
import Spring

extension GameView{
    
    func startStateOfAnimations(){
        self.pastel?.removeFromSuperview()
        self.pastel? = Pastel.startPastel(view: self.view, color: "normal", speed: 1.5)
        
        healthBar.barColor = UIColor.flatGreen()
        
        heartImageView.animation = "pop"
        heartImageView.force = 0.2
        heartImageView.duration = 1.0
        heartImageView.repeatCount = 1000
        
        healthBarSpringView.animation = "swing"
        healthBarSpringView.force = 0.2
        healthBarSpringView.duration = 1.0
        healthBarSpringView.repeatCount = 1000
        
        pointLabel.animation = "wobble"
        pointLabel.force = 0.2
        pointLabel.duration = 1.6
        pointLabel.repeatCount = 1000
        
        pointLabel.animate()
        healthBarSpringView.animate()
        heartImageView.animate()

    }
    
}
