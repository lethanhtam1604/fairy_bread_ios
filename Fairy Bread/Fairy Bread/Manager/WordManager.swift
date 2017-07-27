//
//  WordManager.swift
//  Fairy Bread
//
//  Created by Thanh-Tam Le on 10/22/16.
//  Copyright © 2016 Lavamy. All rights reserved.
//

import UIKit

class WordManager: NSObject {

    static let shared = WordManager()
    var wordArray = [String]()
    
    override init() {
        super.init()
        wordArray = FileManager.readFile(fileName: "Words")
    }
    
    func search(keyWord: String) -> [String] {
        var result = [String]()

        for word in wordArray {
            if word.lowercased().contains(keyWord.lowercased()) {
                result.append(word)
            }
        }
        
        return result
    }
}
