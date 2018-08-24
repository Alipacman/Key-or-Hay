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
    var viewContainer : UIView?
    var imageContainer : UIImageView?
    
    public init(image : UIImage, frame: CGRect) {
        super.init(frame: frame)
        self.image = image
        self.viewContainer = self.createViewContainer()
        self.imageContainer = self.createImageContainer()
        self.viewContainer?.addSubview(imageContainer!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func createImageContainer() -> UIImageView {
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
