//
//  Card.swift
//  memory
//
//  Created by Jade Thomason on 3/15/18.
//  Copyright © 2018 Steven Brown. All rights reserved.
//

import Foundation

class Card {
    
    var faceDown: Bool
    var faceUp: Bool
    var matched: Bool
    
    init(faceDown: Bool, faceUp: Bool, matched: Bool) {
        self.faceDown = faceDown
        self.faceUp = faceUp
        self.matched = matched
    }
    
}
