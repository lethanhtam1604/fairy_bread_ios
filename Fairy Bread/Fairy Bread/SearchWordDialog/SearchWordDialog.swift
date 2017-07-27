//
//  SearchWordDialog.swift
//  Fairy Bread
//
//  Created by Thanh-Tam Le on 10/22/16.
//  Copyright © 2016 Lavamy. All rights reserved.
//

import UIKit
import CustomIOSAlertView

class SearchWordDialog {

    private let customIOSAlertView = CustomIOSAlertView()
    private var customView: SearchWordView!
    
    init() {
        customView = SearchWordView.instanceFromNib() as! SearchWordView
        customView.layer.cornerRadius = 10
        customIOSAlertView?.containerView  = customView
        customIOSAlertView?.buttonTitles = nil
        customIOSAlertView?.layer.cornerRadius = 0
        customView.closeBtn.addTarget(self, action: #selector(closeClicked), for: .touchUpInside)
        
    }
 
    @objc func closeClicked() {
        MusicManager.playSound(filename: "click.wav")
        self.hideDialog()
    }
    
    func showDialog() {
        customIOSAlertView?.show()
    }
    
    func hideDialog() {
        customIOSAlertView?.close()
    }
    
    func setAllDataScreenByLocalize() {
        customView.setAllDataScreenByLocalize()
    }

}
