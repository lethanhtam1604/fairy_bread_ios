//
//  SplashScreenViewController.swift
//  Fairy Bread
//
//  Created by Tam Huynh on 9/26/16.
//  Copyright © 2016 Lavamy. All rights reserved.
//

import UIKit
import Foundation

class SplashScreenViewController: UIViewController {
    
    @IBOutlet weak var welcomeView: UIView!
    @IBOutlet weak var fairyBreadView: UIView!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        MusicManager.playBackgroundMusic(filename: "background.mp3")
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2, execute: {
            self.fairyBreadView.isHidden = true
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2, execute: {
                self.welcomeView.isHidden = true
                self.present(MenuViewController(), animated: false, completion: nil)
                
            })
        })
    }
    
}
