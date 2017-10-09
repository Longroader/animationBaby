//
//  Chapter6VC.swift
//  AnimationKing
//
//  Created by Miss on 2017/10/9.
//  Copyright © 2017年 com.miu.ios. All rights reserved.
//

import UIKit

class Chapter6VC: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func loadView() {
        view = Chapter6View.viewFromNib(clsName:"Chapter6View") as! Chapter6View
    }
    
    override func setupUI() {
        
    }
    
}
