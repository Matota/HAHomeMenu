//
//  UIViewController_HAHomeMenu.swift
//  HAHomeMenu
//
//  Created by  Hitesh Ahuja on 2016/4/11.
//  Copyright © 2016 Hitesh Ahuja. All rights reserved.
//

import UIKit

extension UIViewController {
    
    var sideMenuViewController: KVDownMenu? {
        
        var iter = self.presentingViewController
        while (iter != nil) {
            if ((iter?.isKind(of: KVDownMenu.self)) == true) {
                return iter as? KVDownMenu
            }else if ((iter?.presentingViewController != nil) && (iter?.presentingViewController != iter)){
                iter = iter?.presentingViewController
            }else{
                iter = nil
            }
        }
        
        if iter == nil{
            var iter = self.parent
            while (iter != nil) {
                if ((iter?.isKind(of: KVDownMenu.self)) == true) {
                    return iter as? KVDownMenu
                }else if ((iter?.parent != nil) && (iter?.parent != iter)){
                    iter = iter?.parent
                }else{
                    iter = nil
                }
            }
        }
        
        return nil
    }
    
}
