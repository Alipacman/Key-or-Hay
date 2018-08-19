//
//  GetAmountOfAvailblePictures.swift
//  Key or Hay
//
//  Created by Ali Ebrahimi Pourasad on 16.08.18.
//  Copyright © 2018 Ali Ebrahimi Pourasad. All rights reserved.
//

import Foundation

class OnlineImageCount{
let file = "file.txt" //this is the file. we will write to and read from it

let text = "some text" //just a text

if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
    
    let fileURL = dir.appendingPathComponent(file)
    
    //writing
    do {
        try text.write(to: fileURL, atomically: false, encoding: .utf8)
    }
    catch {/* error handling here */}
    
    //reading
    do {
        let text2 = try String(contentsOf: fileURL, encoding: .utf8)
    }
    catch {/* error handling here */}
}
}
