//
//  TutorialController.swift
//  Key or Hay
//
//  Created by Ali Ebrahimi Pourasad on 25.08.18.
//  Copyright © 2018 Ali Ebrahimi Pourasad. All rights reserved.
//

import Foundation
import UIKit
import Spring
import Hero

class TutorialViewController : UIViewController {
    
    @IBOutlet weak var animationButton: SpringButton!
    
    @IBOutlet weak var midView: UIView!
    @IBOutlet weak var heyLabel: SpringLabel!
    
    @IBOutlet weak var aliText: SpringTextView!
    @IBOutlet weak var husseinText: SpringTextView!
    
    let aliImage = #imageLiteral(resourceName: "Ali")
    let husseinImage = #imageLiteral(resourceName: "HusseinKopf")
    
    var counter = 0
    var objectArray : [Any] = []
    
    override func viewDidLoad() {
    }
    

    
    @IBAction func startAnimation(_ sender: Any) {
        switch counter {
        case 0:
            aliStartEntrance(pic : aliImage)
        case 1:
            fadeOutObjectsAndStartHussein(pic: husseinImage)
        case 2:
            enterNextView()
        default:
            print("tutorial switch calles default")
        }
        counter += 1
        animationButton.isEnabled = false
    }
    
    
    
    func aliStartEntrance(pic : UIImage){
        let springImage = SpringImageView(image: pic)
        self.objectArray.append(springImage)
        
        springImage.frame = midView.frame
        self.view.addSubview(springImage)
        
        springImage.animation = "fadeInRight"
        springImage.curve = "easeInExpo"
        springImage.scaleX = 2.2
        springImage.scaleY = 2.3
        springImage.rotate = 1.4
        springImage.damping = 0.7
        springImage.velocity = 1.0
        springImage.duration = 1.0
        springImage.animateNext {
            self.greetingsText(text: "Hey")
        }
    }
    
    func husseinStartEntrance(pic: UIImage) {
        let springImage = SpringImageView(image: pic)
        self.objectArray.append(springImage)
        
        springImage.frame = midView.frame
        self.view.addSubview(springImage)
        
        springImage.animation = "fadeInLeft"
        springImage.curve = "easeInExpo"
        springImage.scaleX = -2.2
        springImage.scaleY = -2.3
        springImage.rotate = 1.4
        springImage.damping = 0.7
        springImage.velocity = 1.0
        springImage.duration = 1.0
        springImage.animateNext {
            self.greetingsText(text: "Halli Hallo")
        }
    }
    
    func greetingsText(text : String) {
        
        self.objectArray.append(heyLabel)
        
        self.heyLabel.isHidden = false
        self.view.sendSubview(toBack: self.heyLabel)
        self.heyLabel.text = "\(text)"

        self.heyLabel.animation = "fadeInUp"
        self.heyLabel.curve = "easeInSine"
        
        self.heyLabel.y = midView.frame.midY
        self.heyLabel.rotate = 2.1

        self.heyLabel.animateNext {
            switch self.counter {
            case 1:
                self.animateText(text: self.aliText)
            case 2:
                self.animateText(text: self.husseinText)
            default:
                print("tutorial switch calles default")
            }
        }
    }
    
    func animateText(text : SpringTextView){
        self.objectArray.append(text)
        text.isHidden = false
        text.animation = "zoomIn"
        text.curve = "easeInSine"
        text.duration = 1.0
        text.delay = 0.5
        
        text.animate()
        text.animateNext {
            self.animationButton.isEnabled = true
        }
    }
    
    func fadeOutObjectsAndStartHussein(pic : UIImage){
        (self.objectArray[0] as! SpringImageView).animation = "fadeOut"
        (self.objectArray[0] as! SpringImageView).animate()
        (self.objectArray[1] as! SpringLabel).animation = "fadeOut"
        (self.objectArray[1] as! SpringLabel).animate()
        (self.objectArray[2] as! SpringTextView).animation = "fadeOut"
        (self.objectArray[2] as! SpringTextView).animate()
        (self.objectArray[2] as! SpringTextView).animateNext {
            self.objectArray.removeAll()
            self.husseinStartEntrance(pic : pic)
        }
        
    }
    
    func enterNextView(){
        (self.objectArray[0] as! SpringImageView).hero.id = "husseinKopf"
        self.animationButton.animation = "fadeOut"
        (self.objectArray[1] as! SpringLabel).animate()
        (self.objectArray[1] as! SpringLabel).animation = "fadeOut"
        (self.objectArray[1] as! SpringLabel).animate()
        (self.objectArray[2] as! SpringTextView).animation = "fadeOut"
        (self.objectArray[2] as! SpringTextView).animate()
        (self.objectArray[2] as! SpringTextView).animateNext {
            self.performSegue(withIdentifier: "NextTutorial", sender: self)
        }
    }
}
