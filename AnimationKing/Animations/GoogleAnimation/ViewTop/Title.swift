//
//  Title.swift
//  GoogleAnimation
//
//  Created by Abhimanyu  on 08/08/17.
//  Copyright © 2017 Konstant. All rights reserved.
//


import Foundation
import UIKit
public class Title:UILabel{
    
    var centerY:NSLayoutConstraint? = NSLayoutConstraint()
    var centerX:NSLayoutConstraint? = NSLayoutConstraint()
    var height:NSLayoutConstraint? = NSLayoutConstraint()
    var width:NSLayoutConstraint? = NSLayoutConstraint()
    
    convenience init(colorBg:UIColor? = .white ) {
        self.init()
        self.backgroundColor = colorBg
    }
}
