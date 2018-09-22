//
//  card+pointLogicController.swift
//  Key or Hay
//
//  Created by Ali Ebrahimi Pourasad on 14.08.18.
//  Copyright © 2018 Ali Ebrahimi Pourasad. All rights reserved.
//

import Foundation
import UIKit
import ZLSwipeableViewSwift
import ChameleonFramework

class CardPointController {
    
    let imageController = ImageController()
    
    var gameView : GameView?
    var timeController : TimeController
    
    var cardCounter = 0
    
    var rightButtons = [Int]()
    
    var zLSwipeableView: ZLSwipeableView
    
    var colorArray = NSArray(ofColorsWith: ColorScheme.analogous, using: UIColor.flatPurple(), withFlatScheme: true)
    
    init( gameView : GameView, timeController : TimeController) {
        self.gameView = gameView
        self.timeController = timeController
        self.zLSwipeableView = gameView.zLSwipeableView
        self.zLSwipeableView.numberOfActiveView = 5
        self.zLSwipeableView.nextView = {
            return self.createView()
        }
        print("init CardPointController")
    }
    
    func createView() -> UIView {
        let imageValues = imageController.getRandomImage()
        rightButtons.append((imageValues![1] as? Int)!)
        
        let cardView = CardView(image : imageValues![0] as! UIImage,frame: zLSwipeableView.bounds)
        cardView.backgroundColor = colorArray?[Int(arc4random_uniform(UInt32(self.colorArray!.count)))] as? UIColor
        return cardView
    }
    
    func buttonPressed(buttonNumber : Int) {
        self.checkResult(pressedButton: buttonNumber)
        cardCounter += 1
        if (cardCounter % 3 == 0){
            self.zLSwipeableView.nextView = {
                return self.createView()
            }
        }
    }
    
    //    TPDO: Anmiate bonustime
    func checkResult(pressedButton : Int) {
        if pressedButton == rightButtons.first{
            self.gameView!.heartImageView.image = #imageLiteral(resourceName: "redHeart")
            self.handleSlideOut(pressedButton: pressedButton)
            self.gameView!.updatePoints(number: 1)
            timeController.AddbonusTime(timeToAdd: 0.4)
        }
        else{
            handleSlideOut(pressedButton: 3)
             self.gameView!.heartImageView.image = #imageLiteral(resourceName: "blackHeart")
            self.gameView!.updatePoints(number: -1)
        }
    }
    
    func handleSlideOut(pressedButton : Int) {
        if pressedButton == 0{
            self.zLSwipeableView.swipeTopView(inDirection: .Left)
        }
        if pressedButton == 1{
            self.zLSwipeableView.swipeTopView(inDirection: .Up)
        }
        if pressedButton == 2{
            self.zLSwipeableView.swipeTopView(inDirection: .Right)
        }
        if pressedButton == 3{
            self.zLSwipeableView.swipeTopView(inDirection: .Down)
        }
        rightButtons.removeFirst()
    }
}
