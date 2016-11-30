//
//  InnerShadowView.swift
//  ClockySum
//
//  Created by Carson Carbery on 11/10/16.
//  Copyright © 2016 Carson Carbery. All rights reserved.
//

//import UIKit
//
//class InnerShadowView: UIView {
//
//
//    override func draw(_ rect: CGRect) {
//        
//        
//        let innerShadow = CALayer()
//        // Shadow path (1pt ring around bounds)
//        let path = UIBezierPath(rect: innerShadow.bounds.insetBy(dx: -1, dy: -1))
//        let cutout = UIBezierPath(rect: innerShadow.bounds).reversing()
//        path.append(cutout)
//        innerShadow.shadowPath = path.cgPath
//        innerShadow.masksToBounds = true
//        // Shadow properties
//        innerShadow.shadowColor = UIColor.darkGray.cgColor
//        innerShadow.shadowOffset = CGSize(width: 0.0, height: 7.0)
//        innerShadow.shadowOpacity = 1
//        innerShadow.shadowRadius = 5
//        // Add
//        self.layer.addSublayer(innerShadow)
//        
//        // Make view round
//        self.layer.cornerRadius = self.frame.size.width/2
//        self.layer.masksToBounds = true
//        
//        // add the shadow to the base view
////        let size = self.frame.size
////        self.clipsToBounds = true
////
////        let newLayer: CALayer = CALayer()
////        newLayer.backgroundColor = UIColor.lightGray.cgColor
////        newLayer.position = CGPoint(x: size.width / 2, y: -size.height / 2 + 0.5)
////        newLayer.bounds = CGRect(x: 0, y: 0, width: size.width, height: size.height)
////        
////        newLayer.shadowColor = UIColor.darkGray.cgColor
////        newLayer.shadowOffset = CGSize(width: 0.0, height: 7.0)
////        newLayer.shadowOpacity = 0.5
////        newLayer.shadowRadius = 5.0
////    
////        self.layer.addSublayer(newLayer)
////        
////        //self.layer.cornerRadius = self.frame.size.width/2
////        self.layer.masksToBounds = true
////
////
////        // add the border to subview
////        let borderView = UIView()
////        borderView.backgroundColor = UIColor.clear
////        borderView.frame = self.bounds
////        borderView.layer.cornerRadius = self.frame.size.width/2
////        borderView.layer.masksToBounds = true
////        self.addSubview(borderView)
////        
//        // Make view round
////        self.layer.cornerRadius = self.frame.size.width/2
//        
//        
//        
//
//   }
//    
//    
//
//}
