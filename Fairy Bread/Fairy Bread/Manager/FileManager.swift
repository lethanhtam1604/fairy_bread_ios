//
//  FileManager.swift
//  Fairy Bread
//
//  Created by Tam Huynh on 9/27/16.
//  Copyright © 2016 Lavamy. All rights reserved.
//

import UIKit
import Foundation

class FileManager: NSObject {

    public static func readFile(fileName: String) -> [String] {
        
        
        if let path = Bundle.main.path(forResource: fileName, ofType: "txt") {
            do {
                let data = try String(contentsOfFile: path, encoding: .utf8)
                let lines = data.components(separatedBy: .newlines)
                return lines
               
            } catch {
                return [String]()
            }
        }
        return [String]()
    }
}
