//
//  ScrollViewController.swift
//  IOS_workshop_Day1
//
//  Created by Piyawut on 2/22/2560 BE.
//  Copyright © 2560 Piyawut Thongsang. All rights reserved.
//

import Foundation
import UIKit

class ScrollViewController2: UIViewController, UIScrollViewDelegate  {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setGesture()
       
       

    }
    func setGesture(){
        
        //สร้าง ตัวตรวจจับ Gesture ต่างๆ (การ tab)
        let doubleTap = UITapGestureRecognizer(
            target: self,
            action: #selector(doubleTapToZoom))  // method อะไรที่จะถุกเรียก
        doubleTap.numberOfTapsRequired  = 2
        scrollView.addGestureRecognizer(doubleTap)
        scrollView.delegate = self
        
    }
    
    func doubleTapToZoom(_ recognizer: UITapGestureRecognizer){
        if(scrollView.zoomScale > scrollView.minimumZoomScale){
            scrollView.setZoomScale(scrollView.minimumZoomScale, animated: true)
        }else{
            scrollView.setZoomScale(scrollView.maximumZoomScale, animated: true)
            
        }
        
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
 
    func viewForZoomingInScrollView(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }

    
   }
