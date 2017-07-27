//
//  MenuViewController.swift
//  Fairy Bread
//
//  Created by Luu Nguyen on 9/15/16.
//  Copyright © 2016 Lavamy. All rights reserved.
//

import UIKit
import PureLayout
import FontAwesomeKit

class MenuViewController: UIViewController {
    var constraintsNeeded = true
    
    let mainMenu = UIView()
    let logoView = UIImageView(image: UIImage(named: "FairyBread"))
    let settingButton = UIImageView(image: UIImage(named: "setting_btn"))
    let exitButton = UIImageView(image: UIImage(named: "exit_game_btn"))
    let infoButton = UIImageView(image: UIImage(named: "info_game_btn"))
    let playButton = UIImageView(image: UIImage(named: "play_game_btn"))
    
    var searchWordDialog: SearchWordDialog!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(mainMenu)
        mainMenu.addSubview(logoView)
        mainMenu.addSubview(settingButton)
        mainMenu.addSubview(playButton)
        mainMenu.addSubview(infoButton)
        mainMenu.addSubview(exitButton)
        
        view.backgroundColor = UIColor.white
        mainMenu.backgroundColor = Global.colorPink
        logoView.contentMode = .scaleAspectFit
        
        let settingGameTap = UITapGestureRecognizer(target: self, action:#selector(MenuViewController.settingGameClicked))
        settingGameTap.numberOfTapsRequired = 1
        settingButton.isUserInteractionEnabled = true
        settingButton.addGestureRecognizer(settingGameTap)
        settingButton.isHidden = true
        
        let playGameTap = UITapGestureRecognizer(target: self, action:#selector(MenuViewController.playGameClicked))
        playGameTap.numberOfTapsRequired = 1
        playButton.isUserInteractionEnabled = true
        playButton.addGestureRecognizer(playGameTap)
        
        let infoGameTap = UITapGestureRecognizer(target: self, action:#selector(MenuViewController.infoGameClicked))
        infoGameTap.numberOfTapsRequired = 1
        infoButton.isUserInteractionEnabled = true
        infoButton.addGestureRecognizer(infoGameTap)
        infoButton.isHidden = true
        
        let exitGameTap = UITapGestureRecognizer(target: self, action:#selector(MenuViewController.exitGameClicked))
        exitGameTap.numberOfTapsRequired = 1
        exitButton.isUserInteractionEnabled = true
        exitButton.addGestureRecognizer(exitGameTap)
        
        view.setNeedsUpdateConstraints()
    }
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        if constraintsNeeded {
            constraintsNeeded = false
            mainMenu.autoPinEdgesToSuperviewEdges()
            
            logoView.autoPinEdge(toSuperviewEdge: .top, withInset: 100)
            logoView.autoPinEdge(toSuperviewEdge: .bottom, withInset: 100)
            logoView.autoPinEdge(toSuperviewEdge: .right, withInset: 100)
            logoView.autoPinEdge(toSuperviewEdge: .left, withInset: 100)
            
//            settingButton.autoPinEdge(toSuperviewEdge: .right, withInset: 260)
//            settingButton.autoPinEdge(toSuperviewEdge: .bottom, withInset: 35)
//            settingButton.autoSetDimensions(to: CGSize(width: 50, height: 50))
            
//            playButton.autoPinEdge(toSuperviewEdge: .right, withInset: 180)
//            playButton.autoPinEdge(toSuperviewEdge: .bottom, withInset: 35)
//            playButton.autoSetDimensions(to: CGSize(width: 50, height: 50))
            
            playButton.autoPinEdge(toSuperviewEdge: .right, withInset: 100)
            playButton.autoPinEdge(toSuperviewEdge: .bottom, withInset: 35)
            playButton.autoSetDimensions(to: CGSize(width: 50, height: 50))
            
            exitButton.autoPinEdge(toSuperviewEdge: .right, withInset: 20)
            exitButton.autoPinEdge(toSuperviewEdge: .bottom, withInset: 35)
            exitButton.autoSetDimensions(to: CGSize(width: 50, height: 50))
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    func settingGameClicked() {
        MusicManager.playSound(filename: "click.wav")
        searchWordDialog = SearchWordDialog()
        searchWordDialog.setAllDataScreenByLocalize()
        searchWordDialog.showDialog()
    }
    
    func playGameClicked() {
        MusicManager.playSound(filename: "click.wav")
        MusicManager.stopBackgroundMusic()
        self.present(PlayGameViewController(), animated: false, completion: nil)
    }
    
    func infoGameClicked() {
        MusicManager.playSound(filename: "click.wav")
        UIApplication.shared.openURL(URL(string: "http://www.fairybreadgames.com")!)
    }
    
    func exitGameClicked() {
        MusicManager.playSound(filename: "click.wav")
        exit(0)
    }
}
