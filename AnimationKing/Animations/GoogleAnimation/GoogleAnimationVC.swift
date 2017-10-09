//
//  GoogleAnimationController.swift
//  GoogleAnimation
//
//  Created by Abhimanyu  on 04/08/17.
//  Copyright © 2017 Konstant. All rights reserved.
//

import UIKit

class GoogleAnimationVC: UIViewController,AnimatorCardDelegate,AnimatorTableDelegate {

    // MARK: - 属性变量
    let gap:CGFloat   = SCREEN_WIDTH*0.02
    
    // MARK: - Override Mehtod
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNav();
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.edgesForExtendedLayout = []
        self.automaticallyAdjustsScrollViewInsets = true;
        self.navigationController?.isNavigationBarHidden = false;
        self.statusBarColor(isWhite: false);
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setView()
    }
    
    // MARK: - Private Method
    private func setNav(){
        self.edgesForExtendedLayout = []
        self.automaticallyAdjustsScrollViewInsets = false;
        self.navigationController?.isNavigationBarHidden = true;
        self.statusBarColor(isWhite: true);
    }
    
    private func setView(){
        // 菜单
        let btnMenu  =  UIButton(type: .custom)
        btnMenu.translatesAutoresizingMaskIntoConstraints = false
        btnMenu.backgroundColor = .clear
        btnMenu.addTarget(self, action: #selector(self.btnActionTaped(btn:)), for: .touchUpInside)
        btnMenu.setImage(UIImage.init(named: "menu"), for: .normal);
        btnMenu.setImage(UIImage.init(named: "backIcon"), for: .selected);
        btnMenu.tag = 1
        self.view.addSubview(btnMenu)
        
        C.set(item: btnMenu, attri: .width, relatedBy: .equal, toItem: self.view, attribute: .width, multiplier: 0.08, constant: 0, viewMain: self.view);
        
        C.set(item: btnMenu, attri: .height, relatedBy: .equal, toItem: self.view, attribute: .width, multiplier: 0.08, constant: 0, viewMain: self.view);
        
        C.set(item: btnMenu, attri: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1.0, constant: gap, viewMain: self.view);
        
        C.set(item: btnMenu, attri: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1.0, constant:  gap*2.5, viewMain: self.view);
        
        // 搜索
        let btnSearch  =  UIButton(type: .custom)
        btnSearch.translatesAutoresizingMaskIntoConstraints = false
        btnSearch.backgroundColor = .clear
        btnSearch.addTarget(self, action: #selector(self.btnActionTaped(btn:)), for: .touchUpInside)
        btnSearch.setImage(UIImage.init(named: "menu"), for: .normal);
        btnSearch.setImage(UIImage.init(named: "back"), for: .selected);
        btnSearch.tag = 1
        self.view.addSubview(btnSearch)
        
        C.set(item: btnSearch, attri: .width, relatedBy: .equal, toItem: self.view, attribute: .width, multiplier: 0.08, constant: 0, viewMain: self.view);
        C.set(item: btnSearch, attri: .height, relatedBy: .equal, toItem: self.view, attribute: .width, multiplier: 0.08, constant: 0, viewMain: self.view);
        C.set(item: btnSearch, attri: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1.0, constant: -gap, viewMain: self.view);
        C.set(item: btnSearch, attri: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1.0, constant: gap*2.5, viewMain: self.view);
        
        //1. 初始化动画
        Animator.shared.setAnimator(UIImage.init(named: "bg.jpeg"), self.view)
        Animator.shared.delegateTable = self
        Animator.shared.delegateCard  = self
        
        //2. initialize animator with CARDS( you can configure your cards like this also)
        //Animator.shared.setAnimator(UIImage.init(named: "bg.jpeg"), self.view,AnimationConfig(cards: [Card.init(bgImage: "0.png", strTitle: "科学", items: [ Model() ] ) ]) )
        
        self.view.bringSubview(toFront: btnMenu)
        self.view.bringSubview(toFront: btnSearch)
    }

    //MARK:- 状态栏颜色
    func statusBarColor(isWhite:Bool = false){
        if isWhite{
            UIApplication.shared.statusBarStyle = .lightContent
            return
        }
        UIApplication.shared.statusBarStyle = .default
    }
    
    //MARK:- 按钮动作
    @objc func btnActionTaped(btn:UIButton){
    
    }
    
    //MARK:- 动画器代理
    func didSelect(item: Model, inCard card: Card){
        //print(item.description)
        //print(card.description)
        let vc = GoogleAnimationDetailVC()
        vc.titleString = card.strTitle;
        self.navigationController?.pushViewController(vc, animated: true);
    }

    func cardClickedFromTopHeader(card: Card){
        //print(card.description);
        let vc = GoogleAnimationDetailVC()
        vc.titleString = card.strTitle;
        self.navigationController?.pushViewController(vc, animated: true);
    }
}

