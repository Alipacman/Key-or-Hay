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
    
    var containerArray = [UIView]()
    var pressCounter = 0
    var count = 4
    var timer = Timer()
    var imageCounter = 0
    
    
    
    override func viewDidLoad() {
        startAfterTime()
        containerArray = []
        
        imageContainer2.isHidden = true
        PointCounter.isHidden = true
        timeCounter.isHidden = true
        super.viewDidLoad()
        
        
//        imageContainer2.addSubview(ImageView)
//        view.addSubview(imageContainer)
//        setupContainer(view: imageContainer)
    }
    

    func startAfterTime(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: {
            self.start()
            
        })
    }
    
    
   @IBAction func buttonClicked(sender: UIButton){
        switch sender.tag {
        case 1:
            animatedSlideoutLeft(card: containerArray[pressCounter])
        case 2:
            animatedSlideoutUp(card: containerArray[pressCounter])
        case 3:
            animatedSlideoutRight(card: containerArray[pressCounter])
        default:
            print("error at buttonClicked()")
        }
        pressCounter += 1
        setViewUp()
    }
    
    
    
    }


