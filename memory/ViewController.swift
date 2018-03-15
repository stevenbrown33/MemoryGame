//
//  ViewController.swift
//  memory
//
//  Created by Steven Brown on 3/15/18.
//  Copyright © 2018 Steven Brown. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var elementImages = [ #imageLiteral(resourceName: "H"), #imageLiteral(resourceName: "He"), #imageLiteral(resourceName: "Li"), #imageLiteral(resourceName: "Be"), #imageLiteral(resourceName: "B"), #imageLiteral(resourceName: "C"), #imageLiteral(resourceName: "N"), #imageLiteral(resourceName: "O"), #imageLiteral(resourceName: "one"), #imageLiteral(resourceName: "two"), #imageLiteral(resourceName: "three"), #imageLiteral(resourceName: "four"), #imageLiteral(resourceName: "five"), #imageLiteral(resourceName: "six"), #imageLiteral(resourceName: "seven"), #imageLiteral(resourceName: "eight")]
    var element = UIImage()
    var isOpen = false
    
    
    @IBOutlet weak var flipCountLabel: UILabel!
    @IBOutlet weak var aButton: CardButton!
    @IBOutlet weak var bButton: CardButton!
    @IBOutlet weak var cButton: CardButton!
    @IBOutlet weak var dButton: CardButton!
    @IBOutlet weak var eButton: CardButton!
    @IBOutlet weak var fButton: CardButton!
    @IBOutlet weak var gButton: CardButton!
    @IBOutlet weak var hButton: CardButton!
    @IBOutlet weak var iButton: CardButton!
    @IBOutlet weak var jButton: CardButton!
    @IBOutlet weak var kButton: CardButton!
    @IBOutlet weak var lButton: CardButton!
    @IBOutlet weak var mButton: CardButton!
    @IBOutlet weak var nButton: CardButton!
    @IBOutlet weak var oButton: CardButton!
    @IBOutlet weak var pButton: CardButton!
    
    var buttons: [CardButton] = []
    
    @IBAction func cardButtonTapped(_ sender: CardButton) {
        flipCount += 1
        if isOpen {
            isOpen = true
            let image = UIImage(named: "cardBacksideImage")
            sender.setImage(image, for: .normal)
            UIView.transition(with: sender, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        } else {
            isOpen = false
            let image = sender.elementImage
            sender.setImage(image, for: .normal)
            UIView.transition(with: sender, duration: 0.3, options: .transitionFlipFromRight, animations: nil, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setButtonsArray()
        randomizeImages()
    }
    
    func setButtonsArray() {
        buttons = [aButton, bButton, cButton, dButton, eButton, fButton, gButton, hButton, iButton, jButton, kButton, lButton, mButton, nButton, oButton, pButton]
    }
    
    func randomizeImages() {
        
        // randomize the images here
        var randomizedImages: [UIImage] = []
        
        for image in elementImages {
            guard let index = elementImages.index(of: image) else { break }
            
            //guard index < 2 else { return }
            let button = buttons[index]
            
            button.elementImage = image
            
        }
    }
    
    var flipCount: Int = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
}
