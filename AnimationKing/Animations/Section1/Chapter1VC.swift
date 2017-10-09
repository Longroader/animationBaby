//
//  Chapter1VC.swift
//  AnimationKing
//
//  Created by miss on 2017/8/31.
//  Copyright © 2017年 com.miu.ios. All rights reserved.
//

import UIKit

class Chapter1VC: BaseViewController {

    // MARK: - 属性变量
    lazy var heading: UILabel = UILabel()
    lazy var username: UITextField = UITextField()
    lazy var password: UITextField = UITextField()
    lazy var login: UIButton = UIButton(type: .custom)
    
    lazy var cloud1: UIImageView = UIImageView(image: UIImage(named: "cloud2"))
    lazy var cloud2: UIImageView = UIImageView(image: UIImage(named: "cloud1"))
    lazy var cloud3: UIImageView = UIImageView(image: UIImage(named: "cloud3"))
    lazy var cloud4: UIImageView = UIImageView(image: UIImage(named: "cloud4"))
    lazy var spinner: UIActivityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: .white)
    
    // 第3章内容
    lazy var status: UIImageView = UIImageView(image: UIImage(named: "Connecting"))
    lazy var label: UILabel = UILabel()
    var loginStatus: Bool = false
    var delayTask: Task!
    var statusPosition: CGPoint = .zero
    let messages: [String] = ["Connecting...", "Authorizing...", "Failed"]
    
    
    
    // MARK: - Override Mehtod
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "第一章：View Animations"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        cloud1.alpha = 0.0
        cloud2.alpha = 0.0
        cloud3.alpha = 0.0
        cloud4.alpha = 0.0
        
        UIView.animate(withDuration: 0.8, delay: 0.7, options: [], animations: {
            self.cloud1.alpha = 1.0
        }, completion: nil)
        UIView.animate(withDuration: 0.8, delay: 0.9, options: [], animations: {
            self.cloud2.alpha = 1.0
        }, completion: nil)
        UIView.animate(withDuration: 0.8, delay: 1.1, options: [], animations: {
            self.cloud3.alpha = 1.0
        }, completion: nil)
        UIView.animate(withDuration: 0.8, delay: 1.3, options: [], animations: {
            self.cloud4.alpha = 1.0
        }, completion: nil)
        
        login.center.y += 50.0
        login.alpha = 0.0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        animateCloud(cloud: cloud1)
        animateCloud(cloud: cloud2)
        animateCloud(cloud: cloud3)
        animateCloud(cloud: cloud4)
        UIView.animate(withDuration: 0.5) {
            self.heading.center.x = self.view.center.x
        }
        
        UIView.animate(withDuration: 0.5, delay: 0.3, options: [], animations: {
            self.username.center.x = self.view.center.x
        }, completion: nil)
        
        UIView.animate(withDuration: 0.5, delay: 0.4, options: [], animations: {
            self.password.center.x = self.view.center.x
        }, completion: nil )
        
        UIView.animate(withDuration: 0.8, delay: 0.5, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: [.curveEaseIn], animations: {
            self.login.center.y -= 50.0
            self.login.alpha = 1.0
        }, completion: nil)
    }
    
    override func setupUI() {
        
        // MARK: - Chapter 1~2
        heading.frame = CGRect(x: 0, y: 200, width: 200, height: 0)
        heading.textAlignment = .center
        heading.font = UIFont.systemFont(ofSize: 30)
        heading.text = "Bahama Login"
        heading.textColor = .white
        heading.sizeToFit()
    
        username.placeholder = "请输入用户"
        username.borderStyle = .roundedRect
        username.backgroundColor = UIColor.white
        username.addTarget(self, action: #selector(textFieldClick(_:)), for: .touchDown)
        username.frame = CGRect(x: 0, y: heading.frame.maxY + 20, width: 250, height: 30)
        
        password.placeholder = "请输入密码"
        password.isSecureTextEntry = true
        password.backgroundColor = .white
        password.borderStyle = .roundedRect
        password.addTarget(self, action: #selector(textFieldClick(_:)), for: .touchDown)
        password.frame = CGRect(x: 0, y: username.frame.maxY + 10, width: 250, height: 30)
        
        login.frame = CGRect(x: 0, y: password.frame.maxY + 20, width: 180, height: 40)
        login.backgroundColor = .orange
        login.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        login.setTitleColor(.white, for: .normal)
        login.addTarget(self, action: #selector(loginClick), for: .touchUpInside)
        login.setTitle("登录", for: .normal)
        login.layer.cornerRadius = 20
        
        spinner.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        spinner.hidesWhenStopped = true
        
        heading.center.x  -= view.bounds.width
        username.center.x -= view.bounds.width
        password.center.x -= view.bounds.width
        login.center.x = view.center.x
        
        view.addSubview(heading)
        view.addSubview(username)
        view.addSubview(password)
        view.addSubview(login)
        login.addSubview(spinner)
        
        cloud1.backgroundColor = .clear
        cloud2.backgroundColor = .clear
        cloud3.backgroundColor = .clear
        cloud4.backgroundColor = .clear
        
        cloud1.frame = CGRect(x: 30, y: 80, width: 60, height: 60)
        cloud2.frame = CGRect(x: 300, y: 220, width: 75, height: 75)
        cloud3.frame = CGRect(x: 100, y: 480, width: 70, height: 70)
        cloud4.frame = CGRect(x: 280, y: 550, width: 80, height: 80)
        
        cloud1.contentMode = .scaleAspectFit
        cloud2.contentMode = .scaleAspectFit
        cloud3.contentMode = .scaleAspectFit
        cloud4.contentMode = .scaleAspectFit
        
        view.insertSubview(cloud1, belowSubview: heading)
        view.insertSubview(cloud2, belowSubview: heading)
        view.insertSubview(cloud3, belowSubview: heading)
        view.insertSubview(cloud4, belowSubview: heading)
        
        // 第3章内容
        status.frame = CGRect(x: 0, y: 0, width: login.frame.width, height: login.frame.height)
        status.center = login.center
        statusPosition = status.center
        status.isHidden = true
        
        label.frame = CGRect(x: 0, y: -4, width: status.frame.width, height: status.frame.height)
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 12)
        
        view.addSubview(status)
        status.addSubview(label)
    }
    
    // MARK: - Private Method
    private func showMessage(index: Int) {
        label.text = messages[index]
        UIView.transition(with: status, duration: 0.33, options: [.curveEaseOut, .transitionFlipFromBottom], animations: {
            self.status.isHidden = false
        }, completion: {_ in
            
            self.delayTask = delay(1.2) {
                if index < self.messages.count - 1 {
                    self.removeMessage(index: index)
                } else {
                    //reset form
                }}
        })
    }
    
    private func removeMessage(index: Int) {
        UIView.animate(withDuration: 0.33, delay: 0.0, options: [], animations: {
            self.status.center.x += self.view.frame.size.width
        }, completion: {_ in
            self.status.isHidden = true
            self.status.center = self.statusPosition
            self.showMessage(index: index + 1)
        })
    }
    
    private func resetForm() {
        
        loginStatus = false
        UIView.animate(withDuration: 0.5, animations: {
            cancel(self.delayTask)
            self.status.isHidden = true
            self.login.bounds.size.width -= 70.0
            self.login.center.y -= 50.0
            self.login.backgroundColor = .orange
            self.login.setTitle("登录", for: .normal)
            self.spinner.stopAnimating()
        })
    }
    
    private func animateCloud(cloud: UIImageView) {
        
        let cloudSpeed = 60.0 / view.frame.size.width
        let duration = (view.frame.size.width - cloud.frame.origin.x) * cloudSpeed
        UIView.animate(withDuration: TimeInterval(duration), delay: 0.0, options: [.curveLinear], animations: {
            cloud.frame.origin.x = self.view.frame.size.width
        }) {[weak self] (_) in
            cloud.frame.origin.x = -cloud.frame.size.width
            self?.animateCloud(cloud: cloud) // 产生了循环引用
        }
    }
    
    // MARK: - 监听
    @objc func loginClick() {
        
        if loginStatus == true {
            resetForm()
            return
        }
        
        UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping:
            0.4, initialSpringVelocity: 0.0, options: [], animations: {
                self.login.bounds.size.width += 70.0
                self.loginStatus = true
                self.showMessage(index: 0)
        }, completion: nil)
        
        UIView.animate(withDuration: 0.3, delay: 0.0, usingSpringWithDamping:
            0.6, initialSpringVelocity: 0.0, options: [], animations: {
                self.login.center.y += 50.0
                self.login.backgroundColor = UIColor(red: 0.85, green: 0.83, blue: 0.45, alpha: 1.0)
        }, completion: nil)
        
        login.setTitle("登录中", for: .normal)
        spinner.startAnimating()
        spinner.center = CGPoint(x: 40.0, y: self.login.frame.size.height/2)
    }
    
    @objc func textFieldClick(_ sender: UITextField) {
        
        UIView.animate(withDuration: 0.2, animations: {
            sender.transform = CGAffineTransform(scaleX: 1.05, y: 1.05)
        }) { (_) in
            UIView.animate(withDuration: 0.2, animations: {
                sender.transform = .identity
            })
        }
    }

}
