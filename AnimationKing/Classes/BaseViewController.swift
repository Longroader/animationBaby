//
//  BaseViewController.swift
//  AnimationKing
//
//  Created by miss on 2017/8/31.
//  Copyright © 2017年 com.miu.ios. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    // MARK: - 属性变量
    var tableView: UITableView?
//    private var navBarBgImage: UIImage?
//    private var navBarShadowImage: UIImage?
    
    // MARK: - Override Mehtod
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func loadView() {
        let bgView = UIImageView(image: UIImage(named: "background"))
        bgView.isUserInteractionEnabled = true
        bgView.frame = UIScreen.main.bounds
        view = bgView
    }

//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//
//        navigationController?.navigationBar.setBackgroundImage(navBarBgImage, for: .any, barMetrics: .default)
//        navigationController?.navigationBar.shadowImage = navBarShadowImage
//    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    

    // MARK: - Public Method
    public func setupUI() {
        view.backgroundColor = .white
        setupNavBar()
        setupTableView()
        // ......
    }
    
    func setupNavBar() {
//        // 保存默认导航栏背景图片和阴影图片
//        navBarBgImage = navigationController?.navigationBar.backgroundImage(for: .any, barMetrics: .default)
//        navBarShadowImage = navigationController?.navigationBar.shadowImage
    }
    
    func setupTableView() {
        
        tableView = UITableView(frame: view.bounds, style: .plain)
        tableView?.frame.origin.y = 64
        if #available(iOS 11.0, *) {
            tableView?.contentInsetAdjustmentBehavior = .never
        } else {
            // Fallback on earlier versions
        };
        
//        tableView?.contentInset = UIEdgeInsets(top: 64, left: 0, bottom: 0, right: 0)
        
        tableView?.rowHeight = 50
        view.addSubview(tableView!)
        // 设置数据源&代理 -> 目的：子类直接实现数据源方法
        tableView?.dataSource = self
        tableView?.delegate = self
    }
    
    deinit {
        print("\(self)释放内存")
    }

}


// MARK: - UITableViewDelegate, UITableViewDataSource
extension BaseViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
