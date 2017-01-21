//
//  ShadowView.swift
//  HAHomeMenu
//
//  Created by Hitesh Ahuja on 2016/10/18.
//  Copyright © 2016 Hitesh Ahuja. All rights reserved.
//

import UIKit

@IBDesignable
class ShadowView: UIView {

    override func draw(_ rect: CGRect) {
        self.layer.borderColor = UIColor(red: 222/255, green: 222/255, blue: 222/255, alpha: 1).cgColor
        self.layer.borderWidth = 0.1
        self.layer.masksToBounds = false
        self.layer.shadowRadius = 2.0
        self.layer.shadowOpacity = 0.2
        self.layer.shadowOffset = CGSize(width: 2.0, height: 2.0); 
    }

}
