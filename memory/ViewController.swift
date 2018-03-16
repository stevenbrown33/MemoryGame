//
//  ViewController.swift
//  memory
//
//  Created by Steven Brown on 3/15/18.
//  Copyright © 2018 Steven Brown. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var elementImages = [#imageLiteral(resourceName: "one"), #imageLiteral(resourceName: "two"), #imageLiteral(resourceName: "three"), #imageLiteral(resourceName: "four"), #imageLiteral(resourceName: "five"), #imageLiteral(resourceName: "six"), #imageLiteral(resourceName: "seven"), #imageLiteral(resourceName: "eight"), #imageLiteral(resourceName: "one"), #imageLiteral(resourceName: "two"), #imageLiteral(resourceName: "three"), #imageLiteral(resourceName: "four"), #imageLiteral(resourceName: "five"), #imageLiteral(resourceName: "six"), #imageLiteral(resourceName: "seven"), #imageLiteral(resourceName: "eight")]
    //var element = UIImage()
    
    var shuffledImages = [UIImage]()

    @IBOutlet weak var flipCountLabel: UILabel!
    @IBOutlet weak var a1Button: CardButton!
    @IBOutlet weak var b1Button: CardButton!
    @IBOutlet weak var c1Button: CardButton!
    @IBOutlet weak var d1Button: CardButton!
    @IBOutlet weak var a2Button: CardButton!
    @IBOutlet weak var b2Button: CardButton!
    @IBOutlet weak var c2Button: CardButton!
    @IBOutlet weak var d2Button: CardButton!
    @IBOutlet weak var a3Button: CardButton!
    @IBOutlet weak var b3Button: CardButton!
    @IBOutlet weak var c3Button: CardButton!
    @IBOutlet weak var d3Button: CardButton!
    @IBOutlet weak var a4Button: CardButton!
    @IBOutlet weak var b4Button: CardButton!
    @IBOutlet weak var c4Button: CardButton!
    @IBOutlet weak var d4Button: CardButton!
    
    var buttons: [CardButton] = []
    
    var isOpen = false
    var imageToQuery: UIImage?
    var prevBtn: CardButton?
    
    @objc fileprivate func reverseCard(timer: Timer) {
        guard let userInfo = timer.userInfo as? [String : Any] else { return }
        guard let tempButton: CardButton = userInfo["btn"] as? CardButton else { return }
        let image = UIImage(named: "cardBacksideImage")
        tempButton.setImage(image, for: .normal)
        UIView.transition(with: tempButton, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
//        button.setImage(image, for: .normal)
//        UIView.transition(with: button, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
//        prevBtn = nil
    }
    
    var timer: Timer?
    fileprivate func setupCard(button: CardButton) {
        
        if button.flag == true {
            Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(reverseCard), userInfo: ["btn" : button], repeats: false)
            prevBtn = nil
        } else {
            flipCount += 1
            let image = button.shuffledImages
            button.setImage(image, for: .normal)
            UIView.transition(with: button, duration: 0.3, options: .transitionFlipFromRight, animations: nil, completion: nil)
            
            if let queryImage = imageToQuery, let prevbtn = prevBtn {
                if queryImage == image && prevbtn.tag != button.tag {
                    print("match")
                    prevbtn.isEnabled = false
                    button.isEnabled = false
                    prevBtn = nil
                    return
                    
                } else {
                    print("No")
                    if let prevbtn = prevBtn, prevBtn?.tag != button.tag {
                        prevbtn.isEnabled = true
                        prevbtn.flag = true
                        setupCard(button: prevbtn)
                        prevbtn.flag = !prevbtn.flag
                        
                        button.flag = true
                        setupCard(button: button)
                        button.flag = !button.flag
                        prevBtn = nil
                        return
                    }
                }
                
            }
            
            
            imageToQuery = image
            button.flag = !button.flag
            prevBtn = button
            prevBtn?.isEnabled = false
        }


    }
    
    @IBAction func buttonTapped(_ sender: CardButton) {
        setupCard(button: sender)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setButtonsArray()
        randomizeImages()
    }
    
    func setButtonsArray() {
        buttons = [a1Button, b1Button, c1Button, d1Button, a2Button, b2Button, c2Button, d2Button, a3Button, b3Button, c3Button, d3Button, a4Button, b4Button, c4Button, d4Button]
    }
    
    func randomizeImages() {
        
        for i in 0..<elementImages.count {
            let random = Int(arc4random_uniform(UInt32(elementImages.count)))
            shuffledImages.append(elementImages[random])
            buttons[i].shuffledImages = elementImages[random]
            buttons[i].tag = i
            elementImages.remove(at: random)
        }
    }
    
    var flipCount: Int = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
}
