//
//  ImageSubmitController.swift
//  Key or Hay
//
//  Created by Ali Ebrahimi Pourasad on 19.08.18.
//  Copyright © 2018 Ali Ebrahimi Pourasad. All rights reserved.
//

import Foundation

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

class ImageSubmitController {
    
    var ref: DatabaseReference!
    var storage : Storage
    var delegate : SubmitDelegate?
    
    init(_ delegate : SubmitDelegate) {
        // Get a reference to the storage service, using the default Firebase App
        self.storage = Storage.storage()
        self.delegate = delegate
    }
    
    func submitImage(image : UIImage){
        let uploadPath = storage.reference(forURL: "gs://hey-or-key.appspot.com/Submitions/\(DateGetter.getDate())")
        if let data = UIImageJPEGRepresentation(image, 0.5) {
            let metadata =  StorageMetadata()
            metadata.contentType = "jpeg"
            uploadPath.putData(data, metadata: metadata) { (meta, error) in
                self.delegate!.ImageSubmitted(self)
            }
        }
    }
}

