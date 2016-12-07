//
//  ViewController.swift
//  seguePractice
//
//  Created by Marty Avedon on 12/6/16.
//  Copyright © 2016 Marty Hernandez Avedon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var label1: UILabel!
    
    var newText: String?
    var sendThis: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // if there's new text sent over from the other view, then unwrap it and display that text inside the label
        if let segueText = newText {
            label1.text = segueText
        } else {
        // if there is no text from the other view to display...display the word "Capitan"
            label1.text = "Capitan!"
        }
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // if we have the right segue, go set up the destination we're trying to segue into
        if segue.identifier == "go" {
            let destination = segue.destination as! OtherViewController
            // if we have text from the text field, send it over
            if let textInside = sendThis {
                destination.newText = textInside
            } else {
            // if we don't have text from the text field, send over the text currently inside our label
                destination.newText = label1.text
            }
        }
    }
    
    @IBAction func saveText(_ sender: UIButton) {
        // if we have text inside the text field, save it in two places: the data manager and a local variable
        if let textFromUser = textField.text {
            sendThis = textFromUser
            StoreData.storeTextFromView.append(sendThis!)
            print(sendThis ?? "something went wrong with saving")
        }
    }
}

