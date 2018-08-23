//
//  Gold.swift
//  Key or Hay
//
//  Created by Ali Ebrahimi Pourasad on 20.08.18.
//  Copyright © 2018 Ali Ebrahimi Pourasad. All rights reserved.
//

import Foundation

class Gold {
    
    static var sharedGold = Gold() // This is singleton
    
    var value : Int
    
    private init(){
        let defaults = UserDefaults.standard
        self.value = defaults.integer(forKey: "GoldValue")
    }
    
    static func addGold(toAdd : Int){
        Gold.sharedGold.value += toAdd
        self.safeGold()
    }
    
    static func safeGold(){
        let defaults = UserDefaults.standard
        defaults.set(Gold.sharedGold.value, forKey: "GoldValue")
        defaults.synchronize()
    }
}
