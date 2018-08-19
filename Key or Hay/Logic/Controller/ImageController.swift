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
    
    func getImagesIntoArray() {

//        getPath ausgelagert
        let filePath = DirectroryHelp.getPath(path: "Images")
        
        let fileManager = FileManager()
        let contents = try? fileManager.contentsOfDirectory(atPath: filePath)
        
        let imageCounter = contents!.count
        
//        imgcounter -1 when simalted?!
        for i in stride(from: 0, to: imageCounter - 1, by: 1) {
            let imageURL = URL(fileURLWithPath: filePath).appendingPathComponent("\(i).jpg")
            let image    = UIImage(contentsOfFile: imageURL.path)
            self.imageArray.append(image!)
        }
    }
    
    func getImageValues() -> Array<Any> {
        self.getImagesIntoArray()
        let randomIndex = Int(arc4random_uniform(UInt32(self.imageArray.count)))
        return [self.imageArray[randomIndex], 1]
    }
}
