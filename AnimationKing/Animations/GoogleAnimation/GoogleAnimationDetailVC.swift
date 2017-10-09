//
//  GoogleAnimationDetailVC.swift
//  GoogleAnimation
//
//  Created by Abhimanyu  on 10/08/17.
//  Copyright © 2017 Konstant. All rights reserved.
//

import UIKit

class GoogleAnimationDetailVC: UIViewController {

    var titleString:String? = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNav()
    }
    
    func setNav(){
        
        self.automaticallyAdjustsScrollViewInsets = false;
        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.title = titleString!
        
        self.view.backgroundColor = .white
    }

}
