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
    
    var imageArray : [UIImage] = []
    
    func getImages() {
        
        var filePath = ""
        var filem = FileManager()
        // Fine documents directory on device
        let dirs : [String] = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.allDomainsMask, true)
        
        let dir = dirs[0] //documents directory
        filePath = dir.appendingFormat("/Images")
        
        let contents = try? filem.contentsOfDirectory(atPath: filePath)
        
        let imageCounter = contents!.count
        for i in stride(from: 0, to: imageCounter - 1, by: 1) {
            let imageURL = URL(fileURLWithPath: filePath).appendingPathComponent("\(i).jpg")
            let image    = UIImage(contentsOfFile: imageURL.path)
            self.imageArray.append(image!)
        }
        print("Image array: \(self.imageArray)")
    }
    
    
    let image = #imageLiteral(resourceName: "husseino")
    let image2 = #imageLiteral(resourceName: "keanu")
    
    var switcher  = true
    
    func getImageValues() -> Array<Any> {
//        if switcher {
//            switcher = !switcher
//            return [image, 1]
//        }
//        switcher = !switcher
//        return  [image2, 2]
        self.getImages()
        let randomIndex = Int(arc4random_uniform(UInt32(self.imageArray.count)))
        return [self.imageArray[randomIndex], 1]
    }
}
