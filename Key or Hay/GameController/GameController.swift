//
//  GameController.swift
//  Key or Hay
//
//  Created by Ali Ebrahimi Pourasad on 31.10.17.
//  Copyright © 2017 Ali Ebrahimi Pourasad. All rights reserved.
//

import UIKit


class GameController: UIViewController {

    
    @IBOutlet weak var PointCounter: UILabel!
    @IBOutlet weak var StartNumberView: UIView!
    @IBOutlet weak var StartNumberLabel: UILabel!
    
    @IBOutlet weak var timeCounter: UILabel!
    @IBOutlet weak var ViewForPictureCon: UIView!
    @IBOutlet weak var imageContainer2: UIView!
    
   
    var pressCounter = 0
    var startSecond = 4
    var timer = Timer()
    
    
    var imageCounter = 0
    var pictureArray = [UIView]()
    
    var pointCounter = 0
    var userGuess = 0
    var solution = 0
    
    override func viewDidLoad() {
        startAfterTime()
        pictureArray = []
        
        imageContainer2.isHidden = true
        PointCounter.isHidden = true
        timeCounter.isHidden = true
        super.viewDidLoad()
        
    }
    
    
    
   @IBAction func buttonClicked(sender: UIButton){
        switch sender.tag {
        case 1:
            animatedSlideoutLeft(card: pictureArray[pressCounter])
        case 2:
            animatedSlideoutUp(card: pictureArray[pressCounter])
        case 3:
            animatedSlideoutRight(card: pictureArray[pressCounter])
        default:
            print("error at buttonClicked()")
        }
        pressCounter += 1
        pointSystem()
        createCard()
    }
    
    
    func pointSystem(){
        if (userGuess == solution) {
            pointCounter += 1
    }
        else{
            pointCounter -= 1
        }
        PointCounter.text = "Points: \(String(pointCounter))"
    }
    
    
}


