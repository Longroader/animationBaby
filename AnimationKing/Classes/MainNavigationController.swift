//
//  MainNavigationController.swift
//  AnimationKing
//
//  Created by miss on 2017/8/28.
//  Copyright © 2017年 com.miu.ios. All rights reserved.
//

import UIKit

class MainNavigationController: UINavigationController, UIGestureRecognizerDelegate {

    // MARK: - 属性变量
    
    // MARK: - Override Mehtod
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavgationBar()
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if self.childViewControllers.count > 0 {
            
            let backBtn = UIButton(type: .custom)
            backBtn.setImage(UIImage(named: "back_ic"), for: .normal)
            backBtn.sizeToFit()
            backBtn.contentEdgeInsets = UIEdgeInsets(top: -2, left: -20, bottom: 0, right: 0)
            backBtn.addTarget(self, action: #selector(back), for: .touchUpInside)
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backBtn)
            
            viewController.hidesBottomBarWhenPushed = true
        }
        
        super.pushViewController(viewController, animated: animated)
    }
    
    // MARK: - Private Method
    private func setupNavgationBar() {
        // 透明导航栏
        navigationBar.barStyle = .black
        navigationBar.shadowImage = UIImage()
        navigationBar.setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
        navigationBar.titleTextAttributes = [.foregroundColor: UIColor.orange,
                                             .font: UIFont.systemFont(ofSize: 22)]
        
        interactivePopGestureRecognizer?.delegate = self
    }
    
    @objc private func back() {
        _ = popViewController(animated: true)
    }

    // MARK: - UIGestureRecognizerDelegate
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return childViewControllers.count > 1
    }
}
