//
//  ViewController.swift
//  MusicPlayer
//
//  Created by Iuri Menin on 05/08/16.
//  Copyright © 2016 Iuri Menin. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var player:AVAudioPlayer = AVAudioPlayer()
    
    @IBOutlet weak var scrubSlider: UISlider!
    @IBOutlet weak var volumeSlider: UISlider!
    
    @IBAction func ajustVolume(sender: UISlider) {
        player.volume = volumeSlider.value
    }
    
    @IBAction func scrub(sender: UISlider) {
        player.currentTime = NSTimeInterval(scrubSlider.value)
    }
    
    @IBAction func play(sender: UIBarButtonItem) {
        player.play()
    }
    
    @IBAction func pause(sender: UIBarButtonItem) {
        player.pause()
    }
    
    @IBAction func stop(sender: UIBarButtonItem) {
        carregarAudio()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        carregarAudio()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func carregarAudio() {
     
        do {
            try player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("music", ofType: "mp3")!))
        } catch {
            
        }
        scrubSlider.value = 0
        scrubSlider.maximumValue = Float(player.duration)
        
        NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: #selector(ViewController.updateTime), userInfo: nil, repeats: true)
    }
    
    func updateTime() {
        scrubSlider.value = Float(player.currentTime)
    }
}