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
import PromiseKit

class NetworkController {
    
    var ref: DatabaseReference!
    var storage : Storage
    
    
    init() {
        // Get a reference to the storage service, using the default Firebase App
        self.storage = Storage.storage()
    }
    
    func start() {
        self.loadImgWithPromise()
    }
    
    func loadImgWithPromise() {
        firstly{
            self.downloadCountFile()
            }.then {
                return self.readSetCount()
            }.then {countArray in
                self.downloadAllFolders(countArray: countArray)
            }.done {
                print("done")
        }
    }
    
    //    TODO: Add delegatefunc if no internet connection
    func downloadAllFolders(countArray: [String]) -> Promise<Void> {
        return Promise {seal in
            self.downloadImagesFromFolder(folder: "Ali", amount: Int(countArray[0])!)
            self.downloadImagesFromFolder(folder: "Hussein", amount: Int(countArray[1])!)
            self.downloadImagesFromFolder(folder: "Random", amount: Int(countArray[2])!)
            seal.fulfill(())
        }
    }
    
    func downloadImagesFromFolder(folder: String, amount : Int) {
        
        let dataPath = DirectroryHelp.getPath(path : "Images/\(folder)")
        
        for i in stride(from: 0, to: amount , by: 1) {
            let localURL = URL(fileURLWithPath: dataPath).appendingPathComponent("\(i).jpg")
            if self.checkIfDataExists(dataPath: "Images/\(i).jpg"){
                print("image \(i) will be downloaded")
                let imageRef = storage.reference(forURL: "gs://hey-or-key.appspot.com/Images/\(folder)/\(i).jpg")
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
