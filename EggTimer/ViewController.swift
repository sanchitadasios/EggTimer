//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var hardnessCalculator = ["Soft":300,"Medium":480,"Hard":720]
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    var totalTime = 0
    var secondsPassed = 0
    var player : AVAudioPlayer?
    
    @IBAction func harnessDetected(_ sender: UIButton) {
        var secondsPassed = 0
//        var timer = Timer()
//        timer.invalidate()
        let hardness = sender.currentTitle!
        titleLabel.text = hardness
        progressBar.progress = 0
//        var remainingSecs = 0
//        if ((hardnessCalculator[hardness]!) != nil) {
        totalTime = hardnessCalculator[hardness]!

//        }
//        else{
//            print("Error")
//            return
//        }
//        var remainingSecs = hardnessCalculator[hardness]
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [self] Timer in
            secondsPassed += 1
            print("\(secondsPassed) seconds.")
            progressBar.setProgress(Float(secondsPassed)/Float(totalTime), animated: true)
            
            if secondsPassed==totalTime {
                Timer.invalidate()
                titleLabel.text = "Up!"
                playSound()
            }
        }
        
        //Example for switch case using where statement
//        switch hardness {
//        case _ where hardnessCalculator[hardness] != nil:
//                print(hardnessCalculator[hardness]!)
//        
//            default:
//                print("Error")
//        }
    }
    
    func playSound() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player!.play()
                   
       }
}
