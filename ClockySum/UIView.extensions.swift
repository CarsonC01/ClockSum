//
//  UIView.extensions.swift
//  ClockySum
//
//  Created by Carson Carbery on 12/2/16.
//  Copyright © 2016 Carson Carbery. All rights reserved.
//

import Foundation
import UIKit

// UIView extension for setting of corner radius and shadow (Material Design)

extension UIView {
    
    @IBInspectable var shadow: Bool {
        get {
            return layer.shadowOpacity > 0.0
        }
        set {
            if newValue == true {
                self.addShadow()
            }
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return self.layer.cornerRadius
        }
        set {
            self.layer.cornerRadius = newValue
            
            // Don't touch the masksToBound property if a shadow is needed in addition to the cornerRadius
            if shadow == false {
                self.layer.masksToBounds = true
            }
        }
    }
    
    
    func addShadow(shadowColor: CGColor = UIColor.black.cgColor,
                   shadowOffset: CGSize = CGSize(width: 0.0, height: 5.0),
                   shadowOpacity: Float = 0.4,
                   shadowRadius: CGFloat = 6.0) {
        layer.shadowColor = shadowColor
        layer.shadowOffset = shadowOffset
        layer.shadowOpacity = shadowOpacity
        layer.shadowRadius = shadowRadius
    }
}
