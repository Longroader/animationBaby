//
//  Chapter4View.swift
//  AnimationKing
//
//  Created by miss on 2017/9/8.
//  Copyright © 2017年 com.miu.ios. All rights reserved.
//

import UIKit
import QuartzCore

// 延迟执行函数
func delay(seconds: Double, completion: @escaping ()-> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + seconds, execute: completion)
}

enum AnimationDirection: Int {
    case positive = 1
    case negative = -1
}

class Chapter4View: UIView {

    // MARK: - 属性变量
    @IBOutlet weak var bgImageView: UIImageView!
    
    @IBOutlet weak var summaryBg: UIView!
    @IBOutlet weak var summaryIcon: UIImageView!
    @IBOutlet weak var summary: UILabel!
    
    @IBOutlet weak var flightNr: UILabel!
    @IBOutlet weak var gateNr: UILabel!
    @IBOutlet weak var departingFrom: UILabel!
    @IBOutlet weak var arrivingTo: UILabel!
    @IBOutlet weak var planeImage: UIImageView!
    
    @IBOutlet weak var flightStatus: UILabel!
    @IBOutlet weak var statusBanner: UIImageView!
    
    var snowView: SnowView!
    
    // MARK: - Override Mehtod
    override func awakeFromNib() {
        // 添加雪花
        snowView = SnowView(frame: CGRect(x: -150, y:-100, width: 300, height: 50))
        let snowClipView = UIView(frame: frame.offsetBy(dx: 0, dy: 64))
        snowClipView.clipsToBounds = true
        snowClipView.addSubview(snowView)
        addSubview(snowClipView)
        // 执行动画
        changeFlight(to: londonToParis)
    }
    
    deinit {
        print("\(self)DEINIT")
    }
    
    // MARK: - Private Method
    // MARK: - 第1234章
    func changeFlight(to data: FlightData, animated: Bool = false) {
        
//        summary.text = data.summary
        
        if animated {
            planeDepart()
            summarySwitch(to: data.summary)
            fade(imageView: bgImageView, toImage: UIImage(named: data.weatherImageName)!, showEffects: data.showWeatherEffects)
            
            let direction: AnimationDirection = data.isTakingOff ? .positive : .negative
            cubeTransition(label: flightNr, text: data.flightNr, direction: direction)
            cubeTransition(label: gateNr, text: data.gateNr, direction: direction)
            cubeTransition(label: departingFrom, text: data.departingFrom, direction: direction)
            cubeTransition(label: arrivingTo, text: data.arrivingTo, direction: direction)
            cubeTransition(label: flightStatus, text: data.flightStatus, direction: direction)
        } else {
            
            bgImageView.image = UIImage(named: data.weatherImageName)
            snowView.isHidden = !data.showWeatherEffects
            
            flightNr.text = data.flightNr
            gateNr.text = data.gateNr
            departingFrom.text = data.departingFrom
            arrivingTo.text = data.arrivingTo
            flightStatus.text = data.flightStatus
        }
        
        // schedule next flight
        delay(seconds: 3.5) {
            self.changeFlight(to: data.isTakingOff ? parisToRome : londonToParis, animated: true)
        }
    }
    
    func fade(imageView: UIImageView, toImage: UIImage, showEffects: Bool) {
        
        UIView.transition(with: imageView, duration: 1.0, options: .transitionCrossDissolve, animations: {
            imageView.image = toImage
        }, completion: nil)
        
        UIView.animate(withDuration: 1.0, delay: 0.0, options: .curveEaseOut, animations: {
            self.snowView.alpha = showEffects ? 1.0 : 0.0
        }, completion: nil)
    }
    
    func cubeTransition(label: UILabel, text: String, direction: AnimationDirection) {
        // 1.创建一个和需要做动画的Label一模一样的新Label
        let auxLabel = UILabel(frame: label.frame)
        auxLabel.text = text
        auxLabel.font = label.font
        auxLabel.textAlignment = label.textAlignment
        auxLabel.textColor = label.textColor
        auxLabel.backgroundColor = label.backgroundColor
        label.superview?.addSubview(auxLabel)
        
        // 2.设置新Label的形变属性scale.y = 0.1(类似于先隐藏)
        let auxLabelOffset = CGFloat(direction.rawValue) * label.frame.height / 2.0
        let transformPositive = CGAffineTransform(translationX: 0.0, y: auxLabelOffset)
        auxLabel.transform = CGAffineTransform(scaleX: 1.0, y: 0.1).concatenating(transformPositive)
        
        // 3.恢复新Label的形变属性为初始值，同时让原来的Label的形变属性scale.y = 0.1（设置成反方向）
        let transformNegative = CGAffineTransform(translationX: 0.0, y: -auxLabelOffset)
        UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseOut, animations: {
            auxLabel.transform = .identity
            label.transform = CGAffineTransform(scaleX: 1.0, y: 0.1).concatenating(transformNegative)
        }, completion: { _ in
            label.text = auxLabel.text
            label.transform = .identity
            auxLabel.removeFromSuperview()
        })
    }
    
    // MARK: - 第5章：keyframes
    private func planeDepart() {
        
        let originalCenter = planeImage.center
        UIView.animateKeyframes(withDuration: 1.5, delay: 0.0, animations: {
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.25, animations: {
                self.planeImage.center.x += 80.0
                self.planeImage.center.y -= 10.0
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.1, relativeDuration: 0.4, animations: {
                self.planeImage.transform = CGAffineTransform(rotationAngle: -.pi / 8)
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.25, animations: {
                self.planeImage.center.x += 100.0
                self.planeImage.center.y -= 50.0
                self.planeImage.alpha = 0.0
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.51, relativeDuration: 0.01, animations: {
                self.planeImage.transform = .identity
                self.planeImage.center = CGPoint(x: 0.0, y: originalCenter.y)
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.55, relativeDuration: 0.45) {
                self.planeImage.alpha = 1.0
                self.planeImage.center = originalCenter
            }
        }, completion: nil)
    }
    
    // MARK: - 第5章：keyframes练习
    private func summarySwitch(to summaryText: String) {
        
        UIView.animateKeyframes(withDuration: 1.5, delay: 0.0, animations: {
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.75, animations: {
                self.summary.center.y -= 100
                self.summaryIcon.center.x -= 200
                self.summaryBg.alpha = 0.0
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.75, relativeDuration: 0.75, animations: {
                self.summary.center.y += 100
                self.summaryIcon.center.x += 200
                self.summaryBg.alpha = 1.0
            })
        }, completion: nil)
        
        delay(0.5) {
            self.summary.text = summaryText
        }
    }

}
