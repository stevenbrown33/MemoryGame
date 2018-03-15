//
//  ViewController.swift
//  memory
//
//  Created by Steven Brown on 3/15/18.
//  Copyright © 2018 Steven Brown. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    var game = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
    
    // Need cardButtons Outlet
    var numberOfPairsOfCards: Int {
        return(cardButtons.count + 1) /2
    }
    
    // Need flipCountLabel Outlet
    var flipCount: Int = 32 {
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    func updateViews() {
        for index in cardButtons.indices{
            let button = cardButtons[index]
            let 
        }
    }
}

