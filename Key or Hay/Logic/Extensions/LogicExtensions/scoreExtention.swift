//
//  scoreExtention.swift
//  Key or Hay
//
//  Created by Ali Ebrahimi Pourasad on 18.09.18.
//  Copyright © 2018 Ali Ebrahimi Pourasad. All rights reserved.
//

import Foundation
import UIKit

extension GameView{
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == nameField{
            let char = string.cString(using: String.Encoding.utf8)
            let isBackSpace = strcmp(char, "\\b")
            if isBackSpace == -92 {
                return true
            }
            return textField.text!.count <= 12
        }
        return true
    }
    
    func submitScore(){
        let uuid = UIDevice.current.identifierForVendor?.uuidString
        var name = "Anonym"
        
        if !(self.nameField.text?.isEmpty)!{
            name = self.nameField.text!
        }
        
        let entry = ScoreEntry(uuid: uuid!, name: name, score: Int((achievedScore.text?.lastWord)!)!)
        if (self.scoreNetworkController!.submitScore(scoreEntry: entry)){
            self.scoreArray.append(entry)
        }
    }
    
    func updateTopScores(){
        let scoreArray = self.scoreNetworkController?.giveTopScores(scoreArray: self.scoreArray)
        for i in (0...4) {
            topNames[i].text = scoreArray![i].name
            topScores[i].text = String(scoreArray![i].score!)
        }
    }
    
}
