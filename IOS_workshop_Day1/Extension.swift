//
//  Extension.swift
//  IOS_workshop_Day1
//
//  Created by Piyawut on 2/23/2560 BE.
//  Copyright © 2560 Piyawut Thongsang. All rights reserved.
//

import UIKit

//extension UIView{
//
//    @IBInspectable var cornorRadius: CGFloat{
//        
//        get{
//            return layer.cornerRadius
//        }
//        set{
//            layer.cornerRadius = newValue
//            layer.masksToBounds = newValue > 0
//        }
//    }
//}





class MyCustomView : UIView {
    
    
    @IBInspectable  var cornerRadius: CGFloat {
        
//        didSet {
//            layer.cornerRadius = cornerRadius
//            layer.masksToBounds = cornerRadius > 0
//        }
        get{
                    return layer.cornerRadius
                }
                set{
                    layer.cornerRadius = newValue
                    layer.masksToBounds = newValue > 0
                }
    }
    
    @IBInspectable  var borderWidth: CGFloat = 0 {
        
        didSet {
            layer.borderWidth = borderWidth
        }
    }

    @IBInspectable  var borderColor: UIColor? {
        
        didSet {
            layer.borderColor = borderColor?.cgColor
        }
    }
    
}

