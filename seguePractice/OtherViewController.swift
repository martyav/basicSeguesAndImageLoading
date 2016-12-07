//
//  OtherViewController.swift
//  seguePractice
//
//  Created by Marty Avedon on 12/6/16.
//  Copyright © 2016 Marty Hernandez Avedon. All rights reserved.
//

import UIKit

class OtherViewController: UIViewController {
    
    @IBOutlet weak var otherLabel: UILabel!
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var clickableImg: UIButton!
    
    var url = URL(string: "https://kingofwallpapers.com/red/red-006.jpg")!
    var newText: String?
    var passThisOver: String = "Tacos!!!"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // if the segue performed correctly, display the text from the previous view controller
        if let segueText = newText {
            otherLabel.text = segueText
        } else {
        // if it didn't display 'Hello world'
        otherLabel.text = "Hello world"
        }
        
        downloadImage(url: url)
        
        // display all the currently stored texts on the XCode console
        for item in StoreData.storeTextFromView {
            print("We've stored this: \(item)")
        }
    }
    
    func downloadImage(url: URL) {
        print("Download Started")
        getDataFrom(url: url) { (data, response, error)  in
            guard let data = data, error == nil else { return }
            print(response?.suggestedFilename ?? url.lastPathComponent)
            print("Download Finished")
            DispatchQueue.main.async() { () -> Void in
                // set a remote image for a normal image view
                self.photo.image = UIImage(data: data)
                // set a remote image for the background of a button -- this is useful for when we want to make clickable images, because making image views clickable is kind of a hack and not good for screen readers
                self.clickableImg.setBackgroundImage(UIImage(data: data), for: .normal)
            }
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // if we have the right segue, set the destination as the view controller we want to go back into
        if segue.identifier == "comeBack" {
            let destination = segue.destination as! ViewController
        // make this view controller display some next text inside its label
            destination.newText = passThisOver
        }
    }

}
