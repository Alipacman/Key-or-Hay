//
//  card+pointLogicController.swift
//  Key or Hay
//
//  Created by Ali Ebrahimi Pourasad on 14.08.18.
//  Copyright © 2018 Ali Ebrahimi Pourasad. All rights reserved.
//

import Foundation
import UIKit

class CardPointController {
    
    let imageController = ImageController()
    
    var gameView : GameView?
    var rightButton : Int?
    
    
    init(_ gameView : GameView) {
        self.gameView = gameView
    }
    
    func spawnCard(){
        let imageValues = imageController.getImageValues()
        rightButton = imageValues[1] as? Int
        let card = Card(image : imageValues[0] as! UIImage, frame: (gameView?.cardContainer.frame)! )
        gameView!.view.addSubview(card)
        gameView!.view.sendSubview(toBack: card)
        
    }
    
    func buttonPressed(buttonNumber : Int) {
        var pointCounter = self.gameView!.pointCounter.text!
        let currentPoints = Int(pointCounter)
        
        if buttonNumber == rightButton{
            pointCounter = "\(Int (currentPoints! + 1))"
        }
        else{
            pointCounter = "\(Int (currentPoints! - 1))"
        }
    }
}
