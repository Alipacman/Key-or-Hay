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
        self.addSubview(imageContainer!)
        layout()
        setup()
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
 
    func setup() {
        // Shadow
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.25
        layer.shadowOffset = CGSize(width: 0, height: 1.5)
        layer.shadowRadius = 4.0
        layer.shouldRasterize = true
        layer.rasterizationScale = UIScreen.main.scale
        
        // Corner Radius
        layer.cornerRadius = 10.0;
    }
    
    func layout() {
        imageContainer?.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.9).isActive = true
        imageContainer?.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.9).isActive = true
        imageContainer?.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        imageContainer?.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        imageContainer?.layer.cornerRadius = 10.0
        imageContainer?.clipsToBounds = true
    }
    
}
