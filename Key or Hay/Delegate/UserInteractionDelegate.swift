//
//  UserInteractionDelegate.swift
//  Key or Hay
//
//  Created by Ali Ebrahimi Pourasad on 13.08.18.
//  Copyright © 2018 Ali Ebrahimi Pourasad. All rights reserved.
//

import Foundation

protocol UserInteractionDelegate {
    
    func pressedLeftButton(_ sender : GameView)
    func pressedRightButton(_ sender : GameView)
    func pressedCenteredButton(_ sender : GameView)
}
