//
//  ViewController.swift
//  helloTxt
//
//  Created by howard lee on 3/13/19.
//  Copyright © 2019 howard lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    var colorLabel = ["red.png","pink.png","orange.png","green.png","blue.png","purple.png","navy.png"]
    
    
    @IBOutlet weak var helloLabel: UILabel!
    @IBOutlet weak var myNameLabel: UILabel!
    @IBOutlet weak var colorButton: UIButton!
    @IBOutlet weak var sizeButton: UIButton!
    
    @IBOutlet weak var textfield: UITextField!
    @IBOutlet weak var image: UIImageView!
    

    
    @IBAction func changeColor(_ sender: Any) {
       // image.backgroundColor = UIColor(patternImage:UIImage( named:"pink.png")!)
        // Method 1: Randomize
        // Swift 4.2
        let x = Int.random(in:0..<7)
        image.image = UIImage( named:colorLabel[x])!
    
        
    }
    
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func changeSize(_ sender: Any) {
        var fontSize = label.font.pointSize
        if (fontSize < 101.0){
            fontSize = fontSize + 10.0
        }else{
            fontSize = 20.0
        }

        label.font = UIFont.boldSystemFont(ofSize: CGFloat(fontSize))
    }
    
    @IBAction func changeText(_ sender: Any) {
        if let value = textfield.text{
            label.text = value.uppercased()
        }
    }
    //generate random color
    func getRandomColor() -> UIColor {
        //Generate between 0 to 1
        let red:CGFloat = CGFloat(drand48())
        let green:CGFloat = CGFloat(drand48())
        let blue:CGFloat = CGFloat(drand48())
        
        return UIColor(red:red, green: green, blue: blue, alpha: 1.0)

    }
    var helloText: String? = "Hello"
    var nameText: String? = "My name is"



    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        helloLabel.textColor = getRandomColor()
        textfield.delegate = self
        helloLabel.text = helloText
        myNameLabel.text = nameText


        
 

    }


}

