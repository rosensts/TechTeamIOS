//
//  SpeechToTextVC.swift
//  TechTeamIOS
//
//  Created by Rosenstein on 3/28/16.
//  Copyright © 2016 Rosenstein. All rights reserved.
//

import Foundation
import AVFoundation
import UIKit

class SpeechToTextVC: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    let synth = AVSpeechSynthesizer()
    var myUtterance = AVSpeechUtterance(string: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func textToSpeech(sender: AnyObject) {
        
        myUtterance = AVSpeechUtterance(string: textView.text)
        myUtterance.rate = 0.3
        synth.speakUtterance(myUtterance)
        
    }
    
}