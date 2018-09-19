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

class ImageDownloadController {
    
    var ref: DatabaseReference!
    var storage : Storage
    var delegate : imgDownloadDelegate?
    
    init(_ delegate : imgDownloadDelegate) {
        // Get a reference to the storage service, using the default Firebase App
        self.storage = Storage.storage()
        self.delegate = delegate
    }
    
    func loadImgWithPromise() {
        firstly{
            self.downloadCountFile()
            }.then {
                return self.readSetCount()
            }.then {countArray in
                self.deleteImages(countArray: countArray)
            }.then {countArray in
                self.downloadAllFolders(countArray: countArray)
            }.done {
                self.delegate?.downloadFinished(self)
        }
    }
    
    
    func deleteImages(countArray: [String]) -> Promise<[String]> {
        return Promise {seal in
            if (Int(countArray[0]) == 1){
                let fileManager = FileManager()
                try fileManager.removeItem(atPath: DirectroryHelp.getPath(path: "Images/"))
            }
            seal.fulfill(countArray)
        }
    }
    
    //    TODO: Add delegatefunc if no internet connection
    func downloadAllFolders(countArray: [String]) -> Promise<Void> {
        return Promise {seal in
            firstly{
                downloadImagesFromFolder(folder: "Ali", amount: Int(countArray[1])!)
                }.then {
                    self.downloadImagesFromFolder(folder: "Hussein", amount: Int(countArray[2])!)
                }.then {
                    self.downloadImagesFromFolder(folder: "Random", amount: Int(countArray[3])!)
                }.done {
                    seal.fulfill(())
            }
        }
    }
    //    currently all pics are png
    func downloadImagesFromFolder(folder: String, amount : Int) -> Promise<Void>{
        
        return Promise {seal in
            let dataPath = DirectroryHelp.getPath(path : "Images/\(folder)")
            //        TODO: check all amounts and the image getter
            for i in stride(from: 1, to: amount + 1, by: 1) {
                let localURL = URL(fileURLWithPath: dataPath).appendingPathComponent("\(i).jpg")
                if DirectroryHelp.checkIfDataExists(dataPath: "Images/\(folder)/\(i).jpg"){
                    let imageRef = storage.reference(forURL: "gs://hey-or-key.appspot.com/Images/\(folder)/\(i).jpg")
                    imageRef.write(toFile: localURL) { url, error in
                        if let error = error {
                            //print("Here is the error: \(error)")
                        } else {
                            if (i == amount){
                                print("all \(folder) images downloaded")
                                return seal.fulfill(())
                            }
                        }
                    }
                }
                else{
                    return seal.fulfill(())
                }
            }
        }
    }
}

