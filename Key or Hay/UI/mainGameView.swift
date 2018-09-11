//
//  mainGameView.swift
//  Key or Hay
//
//  Created by Ali Ebrahimi Pourasad on 10.09.18.
//  Copyright © 2018 Ali Ebrahimi Pourasad. All rights reserved.
//

import Foundation

extension ZLSwipeViewController {
    func startPastel(){
        
        let pastelView = PastelView(frame: view.bounds)
        
        // Custom Direction
        pastelView.startPastelPoint = .bottomLeft
        pastelView.endPastelPoint = .topRight
        
        // Custom Duration
        pastelView.animationDuration = 2.0
        
        // Custom Color
        pastelView.setColors([UIColor(red: 156/255, green: 39/255, blue: 176/255, alpha: 1.0),
                              UIColor(red: 255/255, green: 64/255, blue: 129/255, alpha: 1.0),
                              UIColor(red: 123/255, green: 31/255, blue: 162/255, alpha: 1.0)])
        
        pastelView.startAnimation()
        view.insertSubview(pastelView, at: 0)
    }
}
