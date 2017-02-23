//
//  CircleImageVIewController.swift
//  IOS_workshop_Day1
//
//  Created by Piyawut on 2/23/2560 BE.
//  Copyright © 2560 Piyawut Thongsang. All rights reserved.
//

import Foundation
import UIKit
import QuartzCore

@IBDesignable
class CircleImageVIewController: UIView {
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//    }
    
    override func layoutSubviews() {
       
            super.layoutSubviews()
            layoutbackgrounLayer()
            layoutImageLayer()
            updateLayerProperties()
        }
  
    
    func layoutbackgrounLayer(){
        
        self.backgroudLayer.frame = layer.bounds
    
    
    }
    func layoutImageLayer(){
        
        
    }
  
    
    
    //Base color background layer
    lazy var backgroudLayer: CAShapeLayer! = {
        
        
        var bg = CAShapeLayer()
        self.layer.addSublayer(bg)
        let rect = self.bounds.insetBy(dx: self.lineWidth / 2.0, dy: self.lineWidth / 2.0)
        let path = UIBezierPath(ovalIn: rect)
        bg.path = path.cgPath
        bg.fillColor = self.backgroundLayerColor.cgColor
        bg.lineWidth = self.lineWidth
        
        return bg
    }()
    
    @IBInspectable var backgroundLayerColor: UIColor = UIColor.darkGray{
        didSet{
            updateLayerProperties()
        }
    }
    
    // Display Image
    @IBInspectable var image: UIImage? {
        
        didSet{
            updateLayerProperties()
        }
    }
    
    @IBInspectable var lineWidth: CGFloat = 1.0
    
    lazy var imageLayer: CALayer! = {
        
        let maskLayer = CAShapeLayer()
        let dx = self.lineWidth - 0.5
        let insetBounds = self.bounds.insetBy(dx: dx, dy: dx)
        let innerPath = UIBezierPath(ovalIn: insetBounds)
        maskLayer.path = innerPath.cgPath
        maskLayer.fillColor = UIColor.black.cgColor
        maskLayer.frame = self.bounds
        
        var imgLayer = CALayer()
        imgLayer.mask = maskLayer
        imgLayer.frame = self.bounds
        imgLayer.contentsGravity = kCAGravityResizeAspectFill
        self.layer.addSublayer(imgLayer)
        return imgLayer
        
    }()
    
    func layoutIageLayer(){
        self.imageLayer.frame = layer.bounds
    }

    func updateLayerProperties(){
        
        self.backgroudLayer.fillColor = backgroundLayerColor.cgColor
        
        if let img = image {
            self.imageLayer.contents = img.cgImage
        }
    }
    
}
