//
//  BeatingHeart.swift
//  Key or Hay
//
//  Created by Ali Ebrahimi Pourasad on 25.08.18.
//  Copyright © 2018 Ali Ebrahimi Pourasad. All rights reserved.
//

import Foundation
import UIKit
import Spring

/**
 Heart beating animation
 */
class HeartController {
    
//    Call from ViewWillappear
    static func initImageView(springImageView : SpringImageView) {
        springImageView.hero.id = "heart"
        springImageView.image = #imageLiteral(resourceName: "redHeart")
        springImageView.animation = "pop"
        springImageView.curve = "easeIn"
        springImageView.duration = 1.5
        springImageView.repeatCount = 999999
        springImageView.animate()
    }
}
