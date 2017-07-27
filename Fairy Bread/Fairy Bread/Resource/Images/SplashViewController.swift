//
//  SplashViewController.swift
//  Fairy Bread
//
//  Created by Luu Nguyen on 9/15/16.
//  Copyright © 2016 Lavamy. All rights reserved.
//

import UIKit
import Foundation

class SplashViewController: UIViewController {
    @IBOutlet weak var welcomeView: UIView!
    @IBOutlet weak var fairyBreadView: UIView!

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2, execute: {
            self.fairyBreadView.isHidden = true
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2, execute: {
                self.welcomeView.isHidden = true
                self.present(MenuViewController(), animated: false, completion: nil)
            })
        })
    }
}
