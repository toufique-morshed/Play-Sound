//
//  ViewController.swift
//  Play Sound
//
//  Created by Sekai Lab BD on 3/16/16.
//  Copyright © 2016 Sekai Lab BD. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var nilaBtn: UIButton!
    @IBOutlet weak var jokBtn: UIButton!
    var audioPlayer: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func playMusic(sender: AnyObject) {
        var audioFilePath: String?
        if (sender as! UIButton).titleLabel?.text! == "Nilanjona" {
                        audioFilePath = NSBundle.mainBundle().pathForResource("Nilanjona", ofType: "mp3")
        } else {
            
            audioFilePath = NSBundle.mainBundle().pathForResource("JokhonShomoy", ofType: "mp3")
        }
        if audioFilePath != nil {
            var audioFileUrl = NSURL.fileURLWithPath(audioFilePath!)
            do {
                try audioPlayer = AVAudioPlayer(contentsOfURL: audioFileUrl)
            } catch _ {
                print("Error while playing")
            }
            audioPlayer?.play()
            
        }
    }

    @IBAction func stopPlaying(sender: AnyObject) {
        if audioPlayer != nil {
            audioPlayer?.stop()
        }
    }
}

