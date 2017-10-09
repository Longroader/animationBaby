//
//  MainViewController.swift
//  AnimationKing
//
//  Created by miss on 2017/8/28.
//  Copyright © 2017年 com.miu.ios. All rights reserved.
//

import UIKit

private let LZFBaseCellID = "LZFBaseCellID"

class MainViewController: BaseViewController {
    
    // MARK: - 属性变量
    let namespace = Bundle.main.infoDictionary!["CFBundleExecutable"] as! String
    // ["head": "谷歌动画", "cls" : "GoogleAnimationVC", "chapter": ["谷歌动画Demo"]],
    
    var animations:[[String: Any]] = [["head": "第一课：View Animations",
                                       "chapter": [["name": "1. Getting Started with View Animations",                "cls": "Chapter1VC"],
                                                   ["name": "2. Springs",                                             "cls": "Chapter1VC"],
                                                   ["name": "3. Transitions",                                         "cls": "Chapter3VC"],
                                                   ["name": "4. View Animations in Practice",                         "cls": "Chapter4VC"],
                                                   ["name": "5. Keyframe",                                            "cls": "Chapter5VC"]]],
                                      ["head": "第二课：Auto Layout",
                                       "chapter": [["name": "6. Introduction to Auto Layout",                         "cls": "Chapter1VC"],
                                                   ["name": "7. Animating Constraints",                               "cls": "Chapter1VC"]]],
                                      ["head": "第三课：Layer Animations",
                                       "chapter": [["name": "8. Getting Started with Layer Animations",               "cls": "Chapter1VC"],
                                                   ["name": "9. Animation Keys and Delegates",                        "cls": "Chapter1VC"],
                                                   ["name": "10. Groups and Advanced Timing",                         "cls": "Chapter1VC"],
                                                   ["name": "11. Layer Springs",         "cls": ""],
                                                   ["name": "12. Layer Keyframe Animations and Struct Properties",    "cls": "Chapter1VC"],
                                                   ["name": "13. Shapes and Masks",                                   "cls": "Chapter1VC"],
                                                   ["name": "14. Gradient Animations",                                "cls": "Chapter1VC"],
                                                   ["name": "15. Stroke and path animations",                         "cls": "Chapter1VC"],
                                                   ["name": "16. Replicating Animations",                             "cls": "Chapter1VC"]]],
                                      ["head": "第四课：View Controller Transition Animations",
                                       "chapter": [["name": "17. Presentation Controller & Orientation Animations",   "cls": "Chapter1VC"],
                                                   ["name": "18. UINavigationController Custom Transition Animations","cls": "Chapter1VC"],
                                                   ["name": "19. Interactive UINavigationController Transitions",     "cls": "Chapter1VC"]]],
                                      ["head": "第五课：Animations with UIViewPropertyAnimator",
                                       "chapter": [["name": "20. Getting Started with UIViewPropertyAnimator",        "cls": "Chapter1VC"],
                                                   ["name": "21. Intermediate Animations with UIViewPropertyAnimator","cls": "Chapter1VC"],
                                                   ["name": "22. Interactive Animations with UIViewPropertyAnimator", "cls": "Chapter1VC"],
                                                   ["name": "23. UIViewPropertyAnimator View Controller Transitions", "cls": "Chapter1VC"]]],
                                      ["head": "第六课：3D Animations",
                                       "chapter": [["name": "24. Simple 3D Animations",                               "cls": "Chapter1VC"],
                                                   ["name": "25. Intermediate 3D animations",                         "cls": "Chapter1VC"]]],
                                      ["head": "第七课：Further Types of Animations",
                                       "chapter": [["name": "26. Particle Emitters",                                  "cls": "Chapter1VC"],
                                                   ["name": "27. Frame Animations with UIImageView",                  "cls": "Chapter1VC"]]]]
    
    // MARK: - Override Mehtod
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "动画课程"
        
        setupTableView()
    }

    // MARK: - Private Method
    override func setupTableView() {
        super.setupTableView()
        
        tableView?.register(UITableViewCell.self, forCellReuseIdentifier: LZFBaseCellID)
    }
    
}

// MARK: -
extension MainViewController {
    
    // MARK: - UITableViewDelegate/DataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (animations[section]["chapter"] as! [[String:String]]).count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let titleArr = animations[indexPath.section]["chapter"] as! [[String:String]]
        let cell = tableView.dequeueReusableCell(withIdentifier: LZFBaseCellID, for: indexPath) as UITableViewCell
        cell.textLabel?.text = titleArr[indexPath.row]["name"]
        cell.textLabel?.font = UIFont.systemFont(ofSize: 13)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vcName = (animations[indexPath.section]["chapter"] as! [[String:String]])[indexPath.row]["cls"]!
        let cls = NSClassFromString(namespace + "." + (vcName)) as! UIViewController.Type
        let vc = cls.init()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return animations.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return animations[section]["head"] as? String
    }
}

