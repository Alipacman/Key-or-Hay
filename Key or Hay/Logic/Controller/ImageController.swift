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
    
    var imageArray : Array<Any> = []
    
    init() {
        self.allImagesIntoArray()
    }
    
    func allImagesIntoArray(){
        getImagesIntoArray(folder : "Ali", imageValue : 0)
        getImagesIntoArray(folder : "Hussein", imageValue : 2)
        getImagesIntoArray(folder : "Random", imageValue : 1)
    }
    
    func getImagesIntoArray(folder: String, imageValue : Int) {

        let filePath = DirectroryHelp.getPath(path: "Images/\(folder)")

        let fileManager = FileManager()
        let contents = try? fileManager.contentsOfDirectory(atPath: filePath)
        
        let imageCounter = contents!.count
        
//        imgcounter -1 when simalted?!
        for i in stride(from: 0, to: imageCounter - 1, by: 1) {
            let imageURL = URL(fileURLWithPath: filePath).appendingPathComponent("/\(i).jpg")
            let image = UIImage(contentsOfFile: imageURL.path)
            self.imageArray.append([image!, imageValue])
        }
    }
    
    func getRandomImage() -> Array<Any> {
        let randomIndex = Int(arc4random_uniform(UInt32(self.imageArray.count)))
        return imageArray[randomIndex] as! Array<Any>
    }
}
