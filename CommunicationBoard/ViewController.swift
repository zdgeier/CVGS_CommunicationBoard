//
//  ViewController.swift
//  CommunicationBoard
//
//  Created by CVGS User on 3/11/16.
//  Copyright (c) 2016 CVGS. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var buttons = ["Yes","No","Maybe", "Possibly","+","Hello","Nope", "Yes!","Sound!","Horray!","Hi","How","are","you"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Fixes first utterance bug
        let string = ""
        let utterance = AVSpeechUtterance(string: string)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-GB")
        utterance.rate = AVSpeechUtteranceMinimumSpeechRate
        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speakUtterance(utterance)
        //==========================

        createButtons()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createButtons () {
        
        var i = 0
        var padding = 10
        var row = 0
        for title in buttons {
            let button : UIButton = UIButton()
            var x = 100 * (i+1) + padding
            var y = row * 100 + 100
            button.frame = CGRectMake(CGFloat(x), CGFloat(y), 100, 50)
            button.backgroundColor = UIColor.lightGrayColor()
            button.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
            button.setTitleColor(UIColor.lightGrayColor(), forState: UIControlState.Highlighted)
            button.setTitle(title, forState: UIControlState.Normal)
            button.addTarget(self, action: "say:", forControlEvents: UIControlEvents.TouchUpInside)
            
            self.view.addSubview(button)
            padding += 10
            
            if (i < 3) { i++ }
            else {
                i = 0
                padding = 10
                row++
            }
        }
    }
    
    @IBAction func say(sender: UIButton) {
        let string = sender.currentTitle

        let utterance = AVSpeechUtterance(string: string)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-GB")
        utterance.rate = AVSpeechUtteranceMinimumSpeechRate
        
        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speakUtterance(utterance)
    }
}

