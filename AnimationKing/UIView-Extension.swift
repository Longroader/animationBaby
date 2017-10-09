//
//  UIView-Extension.swift
//  AnimationKing
//
//  Created by miss on 2017/9/8.
//  Copyright © 2017年 com.miu.ios. All rights reserved.
//

import UIKit

public extension UIView {
    public class func viewFromNib(clsName: String) -> UIView {
        return Bundle.main.loadNibNamed(clsName, owner: nil, options: nil)?.first as! UIView
    }
}
