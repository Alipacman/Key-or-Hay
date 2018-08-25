//
//  HighscoreDownloadCon.swift
//  Key or Hay
//
//  Created by Ali Ebrahimi Pourasad on 19.08.18.
//  Copyright © 2018 Ali Ebrahimi Pourasad. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase

class ScoreDownloadController {
    
    var ref: DatabaseReference!
    var database : Database
    var scoreArray : [ScoreEntry] = []
    
    init() {
        self.database = Database.database()
        ref = Database.database().reference()
        self.getScores()
    }
    
    func submitScore(scoreEntry : ScoreEntry){
        let uuid = UIDevice.current.identifierForVendor?.uuidString
        
        let oldHighScore = self.getOldHighscore(uuid : uuid!)
        
        if (oldHighScore < scoreEntry.score!){
            self.ref.child("\(uuid)").setValue(["name" : scoreEntry.name!, "score" :scoreEntry.score!])
            scoreArray.removeAll(keepingCapacity: false)
        }
    }
    
    //    TODO: fix this
    func getOldHighscore(uuid : String) -> Int {
        
        var oldScore = 0
        self.ref.observe(DataEventType.value, with: { (snapshot) in
            // Get user value
            
            let value = snapshot.value as? NSDictionary
            let user = value?.allKeys(for: uuid)
            let castedScore = user as! NSDictionary
            oldScore = castedScore["score"] as? Int ?? 0
            
        }) { (error) in
            print("ERROR: \(error.localizedDescription)")
        }
        return oldScore
    }
    
    func getScores(){
        print("downloading Scores")
        scoreArray.removeAll(keepingCapacity: false)
        self.ref.observe(DataEventType.value, with: { (snapshot) in
            // Get user value
            let value = snapshot.value as? NSDictionary
            
            for score in value!.allValues{
                let castedScore = score as! NSDictionary
                let username = castedScore["name"] as? String ?? ""
                let score = castedScore["score"] as? Int ?? 0
                let entry = ScoreEntry(name: username, score: score)
                self.scoreArray.append(entry)
            }
            self.scoreArray = self.scoreArray.sorted(by: { $0.score! > $1.score! })
        }) { (error) in
            print("ERROR: \(error.localizedDescription)")
        }
    }
    
    func giveScore() -> [ScoreEntry] {
        return self.scoreArray
    }
}
