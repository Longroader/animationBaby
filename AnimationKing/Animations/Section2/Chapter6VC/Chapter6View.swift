//
//  Chapter6View.swift
//  AnimationKing
//
//  Created by Miss on 2017/10/9.
//  Copyright © 2017年 com.miu.ios. All rights reserved.
//

import UIKit

let itemTitles = ["Icecream money", "Great weather", "Beach ball", "Swim suit for him", "Swim suit for her", "Beach games", "Ironing board", "Cocktail mood", "Sunglasses", "Flip flops"]

class Chapter6View: UIView, UITableViewDelegate, UITableViewDataSource {

    //MARK: IB outlets
    @IBOutlet var tableView: UITableView!
    @IBOutlet var buttonMenu: UIButton!
    @IBOutlet var titleLabel: UILabel!
    
    //MARK: further class variables
    var slider: HorizontalItemList!
    var isMenuOpen = false
    var items: [Int] = [5, 6, 7]

    override func awakeFromNib() {
        super.awakeFromNib()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(autolayoutCell.self, forCellReuseIdentifier: "autolayoutCell")
        tableView.rowHeight = 54.0
    }
    
    @IBAction func actionToggleMenu(_ sender: AnyObject) {
        
    }
    
    func showItem(_ index: Int) {
        print("tapped item \(index)")
        
    }
    
    // MARK: Table View methods
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "autolayoutCell", for: indexPath) as UITableViewCell
        cell.accessoryType = .none
        cell.textLabel?.text = itemTitles[items[indexPath.row]]
        cell.imageView?.image = UIImage(named: "summericons_100px_0\(items[indexPath.row]).png")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        showItem(items[indexPath.row])
    }
}
