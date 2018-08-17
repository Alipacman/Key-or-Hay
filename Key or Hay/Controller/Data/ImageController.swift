//
//  ImageController.swift
//  Key or Hay
//
//  Created by Ali Ebrahimi Pourasad on 14.08.18.
//  Copyright © 2018 Ali Ebrahimi Pourasad. All rights reserved.
//

import Foundation
import UIKit

class ImageController {
    
    let image = #imageLiteral(resourceName: "husseino")
    let image2 = #imageLiteral(resourceName: "keanu")
    
    var switcher  = true
    
    func getImageValues() -> Array<Any> {
        if switcher {
            switcher = !switcher
            return [image, 1]
        }
        switcher = !switcher
        return  [image2, 2]
    }
}
