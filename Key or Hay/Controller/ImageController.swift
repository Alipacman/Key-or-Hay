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
    
    let image = #imageLiteral(resourceName: "Ahmedo")
    
    func getImageValues() -> Array<Any> {
        return [image, 1]
    }
}
