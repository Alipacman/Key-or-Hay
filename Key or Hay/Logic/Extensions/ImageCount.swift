//
//  GetAmountOfAvailblePictures.swift
//  Key or Hay
//
//  Created by Ali Ebrahimi Pourasad on 16.08.18.
//  Copyright © 2018 Ali Ebrahimi Pourasad. All rights reserved.
//

import Foundation
import UIKit
import PromiseKit

extension ImageDownloadController {
    
    func downloadCountFile() -> Promise<Void> {
        return Promise { seal in
            
            let path = storage.reference(forURL: "gs://hey-or-key.appspot.com/Images/ImageCount.rtf")
            
            let dataPath = DirectroryHelp.getPath(path : "Images")
            let localURL = URL(fileURLWithPath: dataPath).appendingPathComponent("ImageCount.rtf")
            
            path.write(toFile: localURL) { url, error in
                if let error = error {
                    print(error)
                    seal.reject(error)
                } else {
                    print("ImageCount loaded into ImageFolder ")
                    seal.fulfill(())
                }
            }
        }
    }
    
    func readSetCount() -> Promise<[String]> {
        return Promise { seal in
            
            DispatchQueue.global(qos: .background).async {
                let path = DirectroryHelp.getPath(path: "Images/")
                let localURL = URL(fileURLWithPath: path).appendingPathComponent("ImageCount.rtf")
                do {
                    let counts = try String(contentsOf: localURL, encoding: .utf8).lastWords(4)
                    print("here is the images to download count: \(counts)")
                    seal.fulfill(counts)
                }
                catch { print("error at readSetCount")}
            }
        }
    }
}

