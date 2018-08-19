//
//  File.swift
//  Key or Hay
//
//  Created by Ali Ebrahimi Pourasad on 15.08.18.
//  Copyright © 2018 Ali Ebrahimi Pourasad. All rights reserved.
//

import Foundation
import UIKit
extension CardPointController{
    
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
