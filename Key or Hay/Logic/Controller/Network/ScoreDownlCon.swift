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
    
    init() {
        self.database = Database.database()
        ref = Database.database().reference()
        self.scoreArray = []
        downloadScores()
    }
    
    func submitScore(scoreArray : [ScoreEntry] , scoreEntry : ScoreEntry) -> ScoreEntry?{
        
        let uuid = UIDevice.current.identifierForVendor?.uuidString
        
        let oldHighScore = self.getOldHighscore(scoreArray : scoreArray, name : scoreEntry.name!, uuid: scoreEntry.uuid!)
        
        if (oldHighScore <= scoreEntry.score!){
            self.ref.child("\(scoreEntry.name!)").setValue(["uuid" : uuid, "name" : scoreEntry.name!, "score" :scoreEntry.score!])
            return scoreEntry
        }
        return nil
    }
    
    func getOldHighscore(scoreArray : [ScoreEntry] ,name : String, uuid : String) -> Int {
        for entry in scoreArray{
            if (entry.name == name && entry.uuid == uuid){
                return entry.score!
            }
        }
        return 0
    }
    
    func getScores() -> [ScoreEntry]{
        var array : [ScoreEntry] = []
        
        firstly{
            downloadScores()
            }.done{
                array = self.scoreArray!
        }
    }
    
    func downloadScores() ->Promise<Void> {
        
        print("downloading Scores")
        return Promise{ seal in
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
                print("salam \(self.scoreArray)")
                seal.fulfill(self.scoreArray)
            }) { (error) in
                print("ERROR: \(error.localizedDescription)")
            }
            seal.fulfill(())
        }
    }
}
