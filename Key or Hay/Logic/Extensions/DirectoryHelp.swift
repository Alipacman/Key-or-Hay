//
//  getPath.swift
//  Key or Hay
//
//  Created by Ali Ebrahimi Pourasad on 18.08.18.
//  Copyright © 2018 Ali Ebrahimi Pourasad. All rights reserved.
//

import Foundation

class DirectroryHelp{
    
    static func getPath(path : String) -> String{
        var filePath = ""
        var fileManager = FileManager()
        // Fine documents directory on device
        let dirs : [String] = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.allDomainsMask, true)
        
        let dir = dirs[0] //documents directory
        filePath = dir.appendingFormat("/\(path)")
        
        return filePath
    }
}
