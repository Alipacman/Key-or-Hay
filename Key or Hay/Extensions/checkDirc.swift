//
//  checkDirc.swift
//  Key or Hay
//
//  Created by Ali Ebrahimi Pourasad on 16.08.18.
//  Copyright © 2018 Ali Ebrahimi Pourasad. All rights reserved.
//

import Foundation

extension NetworkController {
    
    func checkDirc(pathName : String) -> String {
        var paths: [Any] = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let documentsDirectory: String = paths[0] as? String ?? ""
        // Get documents folder
        
        var isDirc : ObjCBool = false
        
        var dataPath: String = URL(fileURLWithPath: documentsDirectory).appendingPathComponent("\(pathName)").absoluteString
        print(dataPath)
        if !FileManager.default.fileExists(atPath: dataPath, isDirectory: &isDirc) {
            if !isDirc.boolValue{
                dataPath = URL(fileURLWithPath: documentsDirectory).appendingPathComponent("\(pathName)").path
                try? FileManager.default.createDirectory(atPath: dataPath, withIntermediateDirectories: true, attributes: nil)
                print("created Image Folder")
            }
        }
        return dataPath
    }
}
