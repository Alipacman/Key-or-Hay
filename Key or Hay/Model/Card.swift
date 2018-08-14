//
//  Card.swift
//  Key or Hay
//
//  Created by Ali Ebrahimi Pourasad on 13.08.18.
//  Copyright © 2018 Ali Ebrahimi Pourasad. All rights reserved.
//

import Foundation
import UIKit


class Card :UIView {
    
    var image : UIImage?
    
    public init(image : UIImage, frame: CGRect) {
        self.image = image
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func createCard() -> UIView {
        let card = createViewContainer()
        let pic = createViewsPic()
        card.addSubview(pic)
        return card
    }
    
    func createViewsPic() -> UIImageView {
        let imageView = UIImageView()
        imageView.image = image
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
    
}
