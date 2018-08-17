//
//  ScoreEntry.swift
//  Key or Hay
//
//  Created by Ali Ebrahimi Pourasad on 17.08.18.
//  Copyright © 2018 Ali Ebrahimi Pourasad. All rights reserved.
//

import Foundation

struct ScoreEntry {
    
    var name : String?
    var score : Int?
    
    init(name :String, score : Int) {
        self.name = name
        self.score = score
    }
    
}
