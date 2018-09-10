//
//  HealthBar.swift
//  Key or Hay
//
//  Created by Ali Ebrahimi Pourasad on 10.09.18.
//  Copyright © 2018 Ali Ebrahimi Pourasad. All rights reserved.
//

import Foundation
import AMProgressBar

class HealthBarSetup {
    
    static func setup(){
        AMProgressBar.config.barColor = UIColor.init(complementaryFlatColorOf: UIColor.flatPink())
        AMProgressBar.config.barCornerRadius = 10
        AMProgressBar.config.barMode = .determined // .undetermined
        
        AMProgressBar.config.borderColor = .black
        AMProgressBar.config.borderWidth = 2
        
        AMProgressBar.config.cornerRadius = 10
        
        AMProgressBar.config.hideStripes = false
        
        AMProgressBar.config.stripesColor = UIColor.flatPink()
        AMProgressBar.config.stripesDelta = 80
        AMProgressBar.config.stripesMotion = .right // .none or .left
        AMProgressBar.config.stripesOrientation = .diagonalRight // .diagonalLeft or .vertical
        AMProgressBar.config.stripesWidth = 30
        
        AMProgressBar.config.textColor = .black
        AMProgressBar.config.textFont = UIFont.systemFont(ofSize: 12)
        AMProgressBar.config.textPosition = .onBar // AMProgressBarTextPosition
    }
}
