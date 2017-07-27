//
//  SearchWordView.swift
//  Fairy Bread
//
//  Created by Thanh-Tam Le on 10/22/16.
//  Copyright © 2016 Lavamy. All rights reserved.
//

import UIKit
import FontAwesomeKit

class SearchWordView: UIView {
    
    let closeBtn = UIButton()
    let searchBar = UISearchBar()
    let titleLabel = UILabel()
    let wordSearchResultTableView = UITableView()
    private var WordCellReuseIdentifier = "WordCellReuseIdentifier"
    let topView = UIView()
    
    @IBOutlet weak var webView: UIWebView!
    var wordList = [String]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
//        self.backgroundColor = Global.colorAccent
        
        let url = URL(string: "https://google.com")!
        webView.loadRequest(URLRequest(url: url))
        
//        self.addSubview(wordSearchResultTableView)
//        self.addSubview(searchBar)
        self.addSubview(topView)
        topView.addSubview(closeBtn)
//        topView.addSubview(titleLabel)
//        
        topView.layer.cornerRadius = 6
        topView.autoPinEdge(toSuperviewEdge: .top, withInset: 0)
        topView.autoPinEdge(toSuperviewEdge: .right, withInset: 0)
        topView.autoPinEdge(toSuperviewEdge: .left, withInset: 0)
        topView.autoSetDimension(.height, toSize: 40)
//
        let closeIcon = FAKIonIcons.closeIcon(withSize: 20)
        closeIcon?.addAttribute(NSForegroundColorAttributeName, value: UIColor.black)
        let closeImg  = closeIcon?.image(with: CGSize(width: 20, height: 20))
        
        closeBtn.setImage(closeImg, for: .normal)
        closeBtn.autoPinEdge(toSuperviewEdge: .top, withInset: 0)
        closeBtn.autoPinEdge(toSuperviewEdge: .right, withInset: 0)
        closeBtn.autoSetDimensions(to: CGSize(width: 30, height: 30))
//
//        titleLabel.text = "Search".uppercased()
//        titleLabel.textColor = UIColor.white
//        titleLabel.textAlignment = .center
//        titleLabel.adjustsFontSizeToFitWidth = true
//        titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
//        
//        titleLabel.autoCenterInSuperview()
//        titleLabel.autoPinEdge(toSuperviewEdge: .top, withInset: 10)
//        
//        wordList = WordManager.shared.wordArray
//        if #available(iOS 9.0, *) {
//            wordSearchResultTableView.cellLayoutMarginsFollowReadableWidth = false //full width
//        }
//        wordSearchResultTableView.tableFooterView = UIView()//remove empty cell
//        wordSearchResultTableView.delegate = self
//        wordSearchResultTableView.dataSource = self
//        wordSearchResultTableView.register(UINib(nibName: "WordViewCell", bundle: nil), forCellReuseIdentifier: WordCellReuseIdentifier as String)
//        
//        searchBar.searchBarStyle = UISearchBarStyle.prominent
//        searchBar.isTranslucent = false
//        searchBar.layer.borderColor = Global.colorAccent.cgColor
//        searchBar.barTintColor = Global.colorAccent
//        searchBar.tintColor = Global.colorAccent
//        searchBar.autoPinEdge(.top, to: .bottom, of: topView, withOffset: -5)
//        searchBar.autoPinEdge(toSuperviewEdge: .right, withInset: 0)
//        searchBar.autoPinEdge(toSuperviewEdge: .left, withInset: 0)
//        
//        wordSearchResultTableView.autoPinEdge(.top, to: .bottom, of: searchBar, withOffset: -5)
//        wordSearchResultTableView.autoPinEdge(toSuperviewEdge: .right, withInset: 0)
//        wordSearchResultTableView.autoPinEdge(toSuperviewEdge: .left, withInset: 0)
//        wordSearchResultTableView.autoPinEdge(toSuperviewEdge: .bottom, withInset: 0)
//        wordSearchResultTableView.layer.cornerRadius = 6
//
//        searchBar.keyboardType = .numberPad
//        searchBar.returnKeyType = .done
//        searchBar.delegate = self
        
    }
    
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        if searchText == "" {
//            wordList = WordManager.shared.wordArray
//        }
//        else {
//            wordList = WordManager.shared.search(keyWord: searchText)
//        }
//        wordSearchResultTableView.reloadData()
//    }
//    
//    func searchBarShouldReturn(_ searchBar: UISearchBar) -> Bool {
//        self.searchBar.resignFirstResponder()
//        return true
//    }
//    
    class func instanceFromNib() -> UIView {
        return UINib(nibName: "SearchWordView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
    }
    
    func setAllDataScreenByLocalize() {

    }
    
    
//    //MARK - Word TableView
//    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 50
//    }
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return wordList.count
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        
//        let cell: WordViewCell! = tableView.dequeueReusableCell(withIdentifier: WordCellReuseIdentifier as String) as? WordViewCell
//        
//        let word = wordList[indexPath.row]
//        
//        cell.layoutMargins = UIEdgeInsets.zero
//        cell.separatorInset = UIEdgeInsets.zero
//        cell.preservesSuperviewLayoutMargins = false
//        
//        cell.wordLabel.text = word
//        
//        return cell
//    }
//    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        
//    }
}
