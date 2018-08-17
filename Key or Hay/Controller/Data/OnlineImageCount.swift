//
//  GetAmountOfAvailblePictures.swift
//  Key or Hay
//
//  Created by Ali Ebrahimi Pourasad on 16.08.18.
//  Copyright © 2018 Ali Ebrahimi Pourasad. All rights reserved.
//

import Foundation
import UIKit
/*
extension NetworkController {
    
    func getCount() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 20.0, execute: {
            self.downloadCountFile()
            self.readSetCount()
        })
    }
    
    func downloadCountFile() {
        let path = storage.reference(forURL: "gs://hey-or-key.appspot.com/Images/-1.rtf")
        
        let dataPath = self.checkDirc(pathName : "Images")
        let localURL = URL(fileURLWithPath: dataPath).appendingPathComponent("-1.rtf")
        let downloadTask = path.write(toFile: localURL) { url, error in
            if let error = error {
                print(error)
            } else {
                print("CountFile loaded into Documents/Images as -1 ")
            }
        }
    }
    
    func readSetCount(){
        
        let file = "-1.rtf" //this is the file read from it (the count file)
        
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            
            let fileURL = dir.appendingPathComponent("/Images\(file)")
            
            //reading
            do {
                self.count = (try Int(String(contentsOf: fileURL, encoding: .utf8)))!
                print("pciture a!!!!!!!!: \(self.count!)")
            }
            catch {print("getCount failed")}
        }
    }
}
 */
