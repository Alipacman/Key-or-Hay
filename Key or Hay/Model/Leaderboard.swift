//
//  Leaderboard.swift
//  Key or Hay
//
//  Created by Ali Ebrahimi Pourasad on 15.08.18.
//  Copyright © 2018 Ali Ebrahimi Pourasad. All rights reserved.
//

import Foundation

struct Leaderboard {
    
    var names = [String]()
    var scores = [Int]()
    
    
    
    init(names : Array<String>, scores : Array<Int>) {
        self.names = names
        self.scores = scores
    }
    

}
