//
//  GameExpension.swift
//  Key or Hay
//
//  Created by Ali Ebrahimi Pourasad on 01.11.17.
//  Copyright © 2017 Ali Ebrahimi Pourasad. All rights reserved.
//

import Foundation
import UIKit

extension GameController {
    
    func showLayout(){
        PointCounter.isHidden = false
        timeCounter.isHidden = false
    }
    
    func gameStart(){
        showLayout()
        setViewUp()
    }
    

    
    
    func setViewUp(){
        let card = createViewContainer()
        let pic = createViewsPic()
        card.addSubview(pic)
        containerArray.append(card)
        view.addSubview(card)
        view.sendSubview(toBack: card)
        setupContainer(cardToUse: card , PicToUse :pic)
    }
    
    func createViewsPic() -> UIImageView {
        let imageView = UIImageView()
        let imagenumber = imageCounter % 2
        imageView.image = UIImage(named: "\(imagenumber)")
        imageCounter += 1
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }

    func createViewContainer() -> UIView {
        let view = UIView()
        view.backgroundColor = UIColor.black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
    
    
    func setupContainer(cardToUse: UIView, PicToUse : UIImageView){
        cardToUse.topAnchor.constraint(equalTo: imageContainer2.topAnchor).isActive = true
        cardToUse.leftAnchor.constraint(equalTo: imageContainer2.leftAnchor).isActive = true
        cardToUse.widthAnchor.constraint(equalTo: imageContainer2.widthAnchor).isActive = true
        cardToUse.heightAnchor.constraint(equalTo: imageContainer2.widthAnchor).isActive = true
        
        PicToUse.topAnchor.constraint(equalTo: ViewForPictureCon.topAnchor).isActive = true
        PicToUse.leftAnchor.constraint(equalTo: ViewForPictureCon.leftAnchor).isActive = true
        PicToUse.widthAnchor.constraint(equalTo: ViewForPictureCon.widthAnchor).isActive = true
        PicToUse.heightAnchor.constraint(equalTo: ViewForPictureCon.widthAnchor).isActive = true
    }
}
