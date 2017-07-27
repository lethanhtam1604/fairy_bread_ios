//
//  PlayGameViewController.swift
//  Fairy Bread
//
//  Created by Tam Huynh on 9/27/16.
//  Copyright © 2016 Lavamy. All rights reserved.
//

import UIKit

class PlayGameViewController: UIViewController {
    var constraintsNeeded = true

    let mainMenu = UIView()
    let logoView = UIImageView(image: UIImage(named: "FairyBread"))
    let stopButton = UIImageView(image: UIImage(named: "stop_btn"))
    let nextButton = UIImageView(image: UIImage(named: "last_btn"))
    let circleView = UIView()
    let clockImageView = UIImageView(image: UIImage(named: "clock"))
    let timeLabel = UILabel()
    let wordLabel = UILabel()
    
    var timer: Timer!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        MusicManager.playBackgroundMusic(filename: "45_sec_timer.mp3")
        
        view.addSubview(mainMenu)
        mainMenu.addSubview(logoView)
        mainMenu.addSubview(nextButton)
        mainMenu.addSubview(stopButton)
        
        view.backgroundColor = UIColor.white
        
        circleView.backgroundColor = Global.colorBlue
        circleView.layer.cornerRadius = 60
        circleView.layer.masksToBounds = true
        
        timeLabel.textAlignment = NSTextAlignment.center
        timeLabel.textColor = UIColor.white
        timeLabel.font = timeLabel.font.withSize(24)
        timeLabel.text = "45"
        
        mainMenu.addSubview(circleView)
        mainMenu.addSubview(clockImageView)
        mainMenu.addSubview(timeLabel)
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(PlayGameViewController.updateTimer), userInfo: nil, repeats: true)

        wordLabel.textAlignment = NSTextAlignment.left
        wordLabel.textColor = UIColor.black
        wordLabel.font = UIFont.boldSystemFont(ofSize: 30)
        mainMenu.addSubview(wordLabel)
        
        currentWordIndex = Int(arc4random_uniform(UInt32(WordManager.shared.wordArray.count)))
        wordLabel.text = WordManager.shared.wordArray[currentWordIndex]

        //event
        let nextWordTap = UITapGestureRecognizer(target: self, action:#selector(PlayGameViewController.nextWordClicked))
        nextWordTap.numberOfTapsRequired = 1
        nextButton.isUserInteractionEnabled = true
        nextButton.addGestureRecognizer(nextWordTap)
        
        
        let stopGameTap = UITapGestureRecognizer(target: self, action:#selector(PlayGameViewController.stopGameClicked))
        stopGameTap.numberOfTapsRequired = 1
        stopButton.isUserInteractionEnabled = true
        stopButton.addGestureRecognizer(stopGameTap)

        view.setNeedsUpdateConstraints()
    }
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        if constraintsNeeded {
            constraintsNeeded = false
            mainMenu.autoPinEdgesToSuperviewEdges()
            
            logoView.autoPinEdge(toSuperviewEdge: .bottom, withInset: 10)
            logoView.autoPinEdge(toSuperviewEdge: .right, withInset: 10)
            logoView.autoSetDimensions(to: CGSize(width: 150, height: 50))
            
            
            nextButton.autoPinEdge(toSuperviewEdge: .left, withInset: 100)
            nextButton.autoPinEdge(toSuperviewEdge: .bottom, withInset: ScreenSize.SCREEN_HEIGHT/2 - 60)
            nextButton.autoSetDimensions(to: CGSize(width: 50, height: 50))
            
            stopButton.autoPinEdge(toSuperviewEdge: .left, withInset: 180)
            stopButton.autoPinEdge(toSuperviewEdge: .bottom, withInset: ScreenSize.SCREEN_HEIGHT/2 - 60)
            stopButton.autoSetDimensions(to: CGSize(width: 50, height: 50))
            
            circleView.autoPinEdge(toSuperviewEdge: .right, withInset: 25)
            circleView.autoPinEdge(toSuperviewEdge: .top, withInset: 25)
            circleView.autoSetDimensions(to: CGSize(width: 120, height: 120))
            
            clockImageView.autoPinEdge(toSuperviewEdge: .right, withInset: 35)
            clockImageView.autoPinEdge(toSuperviewEdge: .top, withInset: 35)
            clockImageView.autoSetDimensions(to: CGSize(width: 100, height: 100))

            timeLabel.autoPinEdge(toSuperviewEdge: .right, withInset: 35)
            timeLabel.autoPinEdge(toSuperviewEdge: .top, withInset: 35)
            timeLabel.autoSetDimensions(to: CGSize(width: 100, height: 100))
            
            wordLabel.autoPinEdge(toSuperviewEdge: .left, withInset: 105)
            wordLabel.autoPinEdge(toSuperviewEdge: .top, withInset: ScreenSize.SCREEN_HEIGHT/2 - 80)
            wordLabel.autoSetDimensions(to: CGSize(width: 300, height: 100))
        }
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    private var currentWordIndex = 0;

    func nextWordClicked() {
        MusicManager.playSound(filename: "click.wav")
        if (currentWordIndex == WordManager.shared.wordArray.count - 1) {
            currentWordIndex = 0;
        }
        else {
            currentWordIndex += 1;
        }
        wordLabel.text = WordManager.shared.wordArray[currentWordIndex]
    }
    
    func stopGameClicked() {
        MusicManager.playSound(filename: "click.wav")
        MusicManager.stopBackgroundMusic()
        timer.invalidate()
        self.dismiss(animated: false, completion: {});
    }
    
    private var count = 45
    func updateTimer() {
        count = count - 1
        timeLabel.text = String(count)
        
        if(count == 0) {
            timer.invalidate()
            MusicManager.stopBackgroundMusic()
            MusicManager.playSound(filename: "wrong_choice.wav")
            self.dismiss(animated: false, completion: {});
        }
    }
}
