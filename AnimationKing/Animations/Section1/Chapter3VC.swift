//
//  Chapter3VC.swift
//  AnimationKing
//
//  Created by miss on 2017/9/1.
//  Copyright © 2017年 com.miu.ios. All rights reserved.
//

import UIKit

class Chapter3VC: BaseViewController {

    // MARK: - 属性变量
    var animationContainerView: UIView!
    var newView: UIImageView!
    var oldView: UIImageView!
    
    // MARK: - Override Mehtod
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let heartView = UIImageView(image: UIImage(named: "heart")!)
        heartView.center = animationContainerView.center
        UIView.transition(with: animationContainerView,
                          duration: 0.33,
                          options: [.curveEaseOut, .transitionFlipFromBottom],
                          animations: {
                            self.animationContainerView.addSubview(heartView)
        }, completion: nil)
    }
    
    override func setupUI() {
        
        animationContainerView = UIView(frame: view.bounds)
        view.addSubview(animationContainerView!)
        
        oldView = UIImageView(image: UIImage(named: "old"))
        oldView.center = view.center
        oldView.center.y = view.center.y - 200
        view.addSubview(oldView)
        
        newView = UIImageView(image: UIImage(named: "new")!)
        newView.center = oldView.center
        view.insertSubview(newView, belowSubview: oldView)
        
        // 继续1~2章的Demo
        let btn = UIButton(type: .custom)
        btn.frame = CGRect(x: SCREEN_WIDTH - 180, y: SCREEN_HEIGHT - 50, width: 0, height: 0)
        btn.addTarget(self, action: #selector(jump), for: .touchUpInside)
        btn.setTitle(" 继续1~2章Demo—> ", for: .normal)
        btn.sizeToFit()
        btn.backgroundColor = .orange
        view.addSubview(btn)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        // 打开注释查看动画效果
        // 动画一
//        UIView.transition(with: animationContainerView, duration: 0.6,
//                          options: [.curveEaseOut, .transitionFlipFromBottom],
//                          animations: {
//                            self.newView.removeFromSuperview()
//        }, completion: nil)
        
        // 动画二: hide the view via transition
//        UIView.transition(with: self.newView, duration: 0.6,
//                          options: [.curveEaseOut, .transitionFlipFromBottom],
//                          animations: {
//                            self.newView.isHidden = true
//        }, completion: nil )
        
        // 动画三: replace via transition
        UIView.transition(from: oldView, to: newView, duration: 0.8,
                          options: .transitionCrossDissolve, completion: nil)
    }
    
    // MARK: - 监听
    @objc private func jump() {
        _ = navigationController?.pushViewController(Chapter1VC(), animated: true)
    }

}
