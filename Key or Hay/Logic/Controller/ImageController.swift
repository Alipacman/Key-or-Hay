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
    
    var aliArray : Array<Any> = []
    var husseinArray : Array<Any> = []
    var randomArray : Array<Any> = []

    
    init() {
        self.allImagesIntoArray()
    }

    func allImagesIntoArray(){
        getImagesIntoArray(folder : "Ali")
        getImagesIntoArray(folder : "Hussein")
        getImagesIntoArray(folder : "Random")
    }
    
    func getImagesIntoArray(folder: String) {

        let filePath = DirectroryHelp.getPath(path: "Images/\(folder)")

        let fileManager = FileManager()
        let contents = try? fileManager.contentsOfDirectory(atPath: filePath)
        
        let imageCounter = contents!.count
        
//        imgcounter -1 when simalted?!
//        changed to -10 cause error
        for i in stride(from: 1, to: imageCounter - 1, by: 1) {
            let imageURL = URL(fileURLWithPath: filePath).appendingPathComponent("/\(i).jpg")
            let image = UIImage(contentsOfFile: imageURL.path)
            
            switch folder {
            case "Ali":
                self.aliArray.append(image!)
            case "Hussein":
                self.husseinArray.append(image!)
            case "Random":
                self.randomArray.append(image!)
            default:
                break
            }
        }
    }
    
    
    func getRandomImage() -> Array<Any>? {
        let randomArrayIndex = Int(arc4random_uniform(UInt32(100)))
        var arrayToReturn : Array<Any> = []
        
        switch randomArrayIndex {
        case 0...40:
            let randomIndex = Int(arc4random_uniform(UInt32(self.aliArray.count)))
            arrayToReturn = [aliArray[randomIndex], 0 ]
        case 40...80:
            let randomIndex = Int(arc4random_uniform(UInt32(self.husseinArray.count)))
            arrayToReturn = [husseinArray[randomIndex], 2 ]
        case 80...101:
            let randomIndex = Int(arc4random_uniform(UInt32(self.randomArray.count)))
            arrayToReturn = [randomArray[randomIndex], 1 ]
        default:
            break
        }
        return arrayToReturn
    }
}
