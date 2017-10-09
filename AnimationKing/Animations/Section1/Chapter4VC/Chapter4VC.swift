//
//  Chapter4VC.swift
//  AnimationKing
//
//  Created by miss on 2017/9/4.
//  Copyright © 2017年 com.miu.ios. All rights reserved.
//

import UIKit

class Chapter4VC: BaseViewController {
    
    // MARK: - Override Mehtod
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setupUI() {
        
    }
    
    override func loadView() {
        view = Chapter4View.viewFromNib(clsName:"Chapter4View") as! Chapter4View
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
}

