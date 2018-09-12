//
//  mainGameView.swift
//  Key or Hay
//
//  Created by Ali Ebrahimi Pourasad on 10.09.18.
//  Copyright © 2018 Ali Ebrahimi Pourasad. All rights reserved.
//

import Foundation
import Pastel

class Pastel {
    
    static func startPastel(view : UIView, color : String) -> PastelView{
        
        let pastelView = PastelView(frame: view.bounds)
        
        // Custom Direction
        pastelView.startPastelPoint = .bottomLeft
        pastelView.endPastelPoint = .topRight
        
        // Custom Duration
        pastelView.animationDuration = 0.2
        
        // Custom Color
        if (color == "normal"){
        pastelView.setColors([UIColor(red: 156/255, green: 39/255, blue: 176/255, alpha: 1.0),
                              UIColor(red: 255/255, green: 64/255, blue: 129/255, alpha: 1.0),
                              UIColor(red: 123/255, green: 31/255, blue: 162/255, alpha: 1.0)])
        }
        if (color == "triadic"){
            pastelView.setColors([UIColor(red: 39/255, green: 176/255, blue: 156/255, alpha: 1.0),
                                  UIColor(red: 64/255, green: 129/255, blue: 255/255, alpha: 1.0),
                                  UIColor(red: 31/255, green: 162/255, blue: 123/255, alpha: 1.0)])
        }
        
        if (color == "triadic_brown"){
            pastelView.setColors([UIColor(red: 176/255, green: 156/255, blue: 39/255, alpha: 1.0),
                                  UIColor(red: 129/255, green: 255/255, blue: 64/255, alpha: 1.0),
                                  UIColor(red: 162/255, green: 123/255, blue: 31/255, alpha: 1.0)])
        }
        
        if (color == "analogous"){
            pastelView.setColors([UIColor(red: 88/255, green: 39/255, blue: 176/255, alpha: 1.0),
                                  UIColor(red: 255/255, green: 64/255, blue: 224/255, alpha: 1.0),
                                  UIColor(red: 58/255, green: 31/255, blue: 162/255, alpha: 1.0)])
        }
        
        if (color == "analogous_bright"){
            pastelView.setColors([UIColor(red: 176/255, green: 39/255, blue: 128/255, alpha: 1.0),
                                  UIColor(red: 255/255, green: 94/255, blue: 64/255, alpha: 1.0),
                                  UIColor(red: 162/255, green: 31/255, blue: 136/255, alpha: 1.0)])
        }
        
        pastelView.startAnimation()
        view.insertSubview(pastelView, at: 0)
        
        return pastelView
    }
    
}
