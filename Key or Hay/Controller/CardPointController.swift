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
    var rightButton = 0
    var cardArray = [Card]()
    
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
        cardArray.append(card)
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
        cardArray[0].animatedSlideoutUp()
        spawnCard()
    }
    
    func setupContainer(cardToUse: UIView, PicToUse : UIImageView){
        let cardContainer = gameView!.cardContainer
        let imageContainer = gameView!.imageContainer
        
        cardToUse.topAnchor.constraint(equalTo: cardContainer!.topAnchor).isActive = true
        cardToUse.leftAnchor.constraint(equalTo: cardContainer!.leftAnchor).isActive = true
        cardToUse.widthAnchor.constraint(equalTo: cardContainer!.widthAnchor).isActive = true
        cardToUse.heightAnchor.constraint(equalTo: cardContainer!.widthAnchor).isActive = true
        
        PicToUse.topAnchor.constraint(equalTo: imageContainer!.topAnchor).isActive = true
        PicToUse.leftAnchor.constraint(equalTo: imageContainer!.leftAnchor).isActive = true
        PicToUse.widthAnchor.constraint(equalTo: imageContainer!.widthAnchor).isActive = true
        PicToUse.heightAnchor.constraint(equalTo: imageContainer!.widthAnchor).isActive = true
    }
}
