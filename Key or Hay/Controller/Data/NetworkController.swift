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
    var storage : Storage
    var count : Int?
    
    
    
    init() {
        // Get a reference to the storage service, using the default Firebase App
        self.storage = Storage.storage()
    }
    
    func start() {
    }
    
    func getScores() {
        
    }
    
    func submitScore() {
        
    }
    
//    func prepareAsyncPic(){
//        DispatchQueue.main.asyncAfter(deadline: .now() + 20.0, execute: {
//            //    self.getCount()
//            self.getPictures()
//        })
//    }
    
    func getPictures(imageCount : Int){
        
        // Creates Img Folder if not already created and downloads all missing pictures from 0 to imageCount
        
        let dataPath = self.getDirc(pathName : "Images")
        
        for i in stride(from: 0, to: 10, by: 1) {
            let localURL = URL(fileURLWithPath: dataPath).appendingPathComponent("\(i).jpg")
            if self.checkIfDataExists(dataPath: "Images/\(i).jpg"){
                print("image \(i) will be downloaded")
                let imageRef = storage.reference(forURL: "gs://hey-or-key.appspot.com/Images/\(i).jpg")
                imageRef.write(toFile: localURL) { url, error in
                    if let error = error {
                        //                        print("Here is the error: \(error)")
                    } else {
                        print("image \(i) loaded into Documents/Images")
                    }
                }
            }
        }
    }
    
    func addPicture(){
        
    }
    
}
