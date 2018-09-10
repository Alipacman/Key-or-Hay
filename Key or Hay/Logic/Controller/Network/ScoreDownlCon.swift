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
import PromiseKit

class ScoreDownloadController {
    
    var ref: DatabaseReference!
    var database : Database
    var scoreArray : [ScoreEntry]?
    var delegate : highscoreDownDelegate?
    
    init(delegate : highscoreDownDelegate) {
        self.database = Database.database()
        ref = Database.database().reference()
        self.delegate = delegate
        
        self.scoreArray = []
        downloadScores()
    }
    
    func submitScore(scoreEntry : ScoreEntry) -> ScoreEntry?{
        
        
        let oldHighScore = self.getOldHighscore(name : scoreEntry.name!, uuid: scoreEntry.uuid!)
        
        if (oldHighScore <= scoreEntry.score!){
            uploadScore(scoreEntry: scoreEntry)
            return scoreEntry
        }
        return nil
    }
    
    //    TODO: this func doubles the sowhn array in the tabblevieC
    func uploadScore(scoreEntry : ScoreEntry){
        self.ref.child("\(scoreEntry.name!)").setValue(["uuid" : scoreEntry.uuid!, "name" : scoreEntry.name!, "score" :scoreEntry.score!])
    }
    
    func getOldHighscore(name : String, uuid : String) -> Int {
        for entry in self.scoreArray!{
            if (entry.name == name && entry.uuid == uuid){
                return entry.score!
            }
        }
        return 0
    }
    
    func downloadScores() {

        print("downloading Scores")
        self.ref.observe(DataEventType.value, with: { (snapshot) in
            // Get user value
            let value = snapshot.value as? NSDictionary
            
            for score in value!.allValues{
                let castedScore = score as! NSDictionary
                let username = castedScore["name"] as? String ?? ""
                let uuid = castedScore["uuid"] as? String ?? ""
                let score = castedScore["score"] as? Int ?? 0
                let entry = ScoreEntry(uuid: uuid, name: username, score: score)
                self.scoreArray!.append(entry)
            }
            self.scoreArray! = self.scoreArray!.sorted(by: { $0.score! > $1.score! })
            self.delegate?.downloadFinished(self, scoreArray : self.scoreArray!)
        }) { (error) in
            print("ERROR: \(error.localizedDescription)")
        }
    }
}

