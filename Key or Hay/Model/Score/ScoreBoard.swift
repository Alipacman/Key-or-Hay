//
//  Leaderboard.swift
//  Key or Hay
//
//  Created by Ali Ebrahimi Pourasad on 15.08.18.
//  Copyright © 2018 Ali Ebrahimi Pourasad. All rights reserved.
//

import Foundation

struct ScoreBoard {
    
    var entrys = [ScoreEntry]()
    
    init(entrys : Array<ScoreEntry>) {
        self.entrys = entrys
    }
    
    func sortEntrys() {
//        self.entrys.sort(by: p1 < p2)
    }

}
