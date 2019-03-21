//
//  File.swift
//  helloTxt
//
//  Created by howard lee on 3/18/19.
//  Copyright © 2019 howard lee. All rights reserved.
//

import UIKit

class SaveViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var buttonResetTitle: UIButton!
    
    @IBOutlet weak var titleField: UITextField!
    
    @IBAction func changeTitle(_ sender: Any) {
        if let titleString = titleField.text {
            UserDefaults.standard.set(titleString, forKey: "Title")
        }
        
    }
    @IBAction func resetTitle(_ sender: Any) {
        titleField.text = "Hello!"
    }
    
    @IBAction func resetSubtitle(_ sender: Any) {
        subtitleField.text = "My Name Is"

    }
    
    @IBOutlet weak var subtitleField: UITextField!
    
    @IBOutlet weak var buttonResetSubtitle: UIButton!
    
    @IBAction func changeSubtitle(_ sender: Any) {

        if let subtitleString = subtitleField.text{
            UserDefaults.standard.set(subtitleString, forKey: "Subtitle")
        }
        
    }
   
    
//
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let subtitle = UserDefaults.standard.string(forKey: "Subtitle") ?? ""
        let title  = UserDefaults.standard.string(forKey: "Title") ?? ""
        if segue.identifier == "saveSegue" {
            guard let guest = segue.destination as? ViewController else {return}
            guest.helloText = title
            guest.nameText = subtitle

        }
    }

//
    
    
    @IBAction func sendSavedText(_ sender: Any) {
        //need to pass data to View Controller
        self.performSegue(withIdentifier: "saveSegue", sender: self) //[titleField.text!, subtitleField.text!,])
    }
    
    
    //textfield delegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("textFieldShouldReturn")
        textField.resignFirstResponder()
        return true
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //save title and subtitle
        if (UserDefaults.standard.object(forKey: "Title") != nil){
            titleField.text = UserDefaults.standard.string(forKey: "Title")
        }
        
        if(UserDefaults.standard.object(forKey: "Subtitle") != nil){
            subtitleField.text = UserDefaults.standard.string(forKey: "Subtitle")
        }
        
        
        
}

}

