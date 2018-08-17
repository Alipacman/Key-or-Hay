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
    var rightButton = -1
    var cardStackArray = [Card]()
    
    init(_ gameView : GameView) {
        self.gameView = gameView
        print("init CardPointController")
    }
    
    func spawnCard(){
        print("spawning card")
        let imageValues = imageController.getImageValues()
        rightButton = (imageValues[1] as? Int)!
        let card = Card(image : imageValues[0] as! UIImage, frame: (gameView?.cardContainer.frame)!)
        
        gameView!.view.addSubview(card.viewContainer!)
        gameView!.view.sendSubview(toBack: card.viewContainer!)
        self.setupContainer(cardToUse: card.viewContainer!, PicToUse:card.imageContainer!)
        cardStackArray.append(card)
    }
    
    func buttonPressed(buttonNumber : Int) {
        self.checkResult(pressedButton: buttonNumber)
        self.handleSlideOut(pressedButton: buttonNumber)
        print("buttonPressed: \(buttonNumber)")
        spawnCard()
    }
    
    func checkResult(pressedButton : Int) {
        let currentPoints = Int(self.gameView!.pointCounter.text!)
        
        if pressedButton == rightButton{
            self.gameView!.pointCounter.text = String(currentPoints! + 1)
        }
        else{
            self.gameView!.pointCounter.text = String(currentPoints! - 1)
        }
    }
    
    func handleSlideOut(pressedButton : Int) {
        if pressedButton == 0{
            cardStackArray[0].animatedSlideoutRL(direction: "left")
        }
        if pressedButton == 1{
            cardStackArray[0].animatedSlideoutUp()
        }
        if pressedButton == 2{
            cardStackArray[0].animatedSlideoutRL(direction: "right")
        }
        cardStackArray.remove(at: 0)
    }
}
