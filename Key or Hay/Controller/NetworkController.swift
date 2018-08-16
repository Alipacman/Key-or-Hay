//
//  FireBaseController.swift
//  Key or Hay
//
//  Created by Ali Ebrahimi Pourasad on 15.08.18.
//  Copyright © 2018 Ali Ebrahimi Pourasad. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase
import FirebaseStorage

class NetworkController {
    
    var ref: DatabaseReference!
    var availiblepics = 1
    
    func start() {
    }
    
    func getScores() {
        
    }
    
    func submitScore() {
        
    }
    
    func getPictures(){
        
        print("downloading Images")
        // Get a reference to the storage service, using the default Firebase App
        let storage = Storage.storage()
        
        // Get reference to the image on Firebase Storage
        let imageRef = storage.reference(forURL: "gs://hey-or-key.appspot.com/Images/0.jpg")
        
        let dataPath = self.checkDirc(pathName : "Images")
        
        for i in stride(from: 0, to: availiblepics + 1, by: 1) {
            let localURL = URL(fileURLWithPath: dataPath).appendingPathComponent("\(i)")
            let downloadTask = imageRef.write(toFile: localURL) { url, error in
                if let error = error {
                    print(error)
                } else {
                    print("image \(i) loaded into Documents/Images")
                }
            }
        }
        
    }
    
    func addPicture(){
        
    }
    
}
