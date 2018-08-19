//
//  checkDirc.swift
//  Key or Hay
//
//  Created by Ali Ebrahimi Pourasad on 16.08.18.
//  Copyright © 2018 Ali Ebrahimi Pourasad. All rights reserved.
//

import Foundation

extension NetworkController {
    
    /* replaced with getPath
    func getDirc(pathName : String) -> String {
        var paths: [Any] = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let documentsDirectory: String = paths[0] as? String ?? ""
        // Get documents folder
        
        let url = URL(fileURLWithPath: documentsDirectory).appendingPathComponent("\(pathName)").absoluteString
        print("HEREURL NW : \(url)")
        return url
    }
 */
    
    func checkIfDataExists(dataPath : String) -> Bool{
        
        var filePath = ""
        
        // Fine documents directory on device
        let dirs : [String] = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.allDomainsMask, true)
        
            let dir = dirs[0] //documents directory
            filePath = dir.appendingFormat("/" + dataPath)
//            print("Local path = \(filePath)")
        
        let fileManager = FileManager.default
        
        // Check if file exists
        if fileManager.fileExists(atPath: filePath) {
//            print("File exists")
            return false
        } else {
//            print("File does not exist")
        }
        return true
    }
}
