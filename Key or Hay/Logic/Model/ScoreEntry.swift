//
//  ScoreEntry.swift
//  Key or Hay
//
//  Created by Ali Ebrahimi Pourasad on 17.08.18.
//  Copyright © 2018 Ali Ebrahimi Pourasad. All rights reserved.
//

import Foundation

struct ScoreEntry :Hashable {
    
    var hashValue: Int
    
    var uuid : String?
    var name : String?
    var score : Int?
    
    init(uuid : String ,name :String, score : Int) {
        self.uuid = uuid
        self.name = name
        self.score = score
        self.hashValue = score
    }
    
}
