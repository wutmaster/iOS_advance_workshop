//
//  ScrollViewController.swift
//  IOS_workshop_Day1
//
//  Created by Piyawut on 2/22/2560 BE.
//  Copyright © 2560 Piyawut Thongsang. All rights reserved.
//

import Foundation
import UIKit

class ScrollViewController: UIViewController, UIScrollViewDelegate  {
    
    var scrollView: UIScrollView!
    var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 1. สร้าง UIImageView พร้อม UIImage เริ่มต้น
        imageView = UIImageView(image: UIImage(named: "image"))
        // 2. สร้าง UIScrollView ให้มีขนาดเท่ากับพื้นที่ของ UIView ตัวบนสุด
        scrollView = UIScrollView(frame: view.bounds)
        scrollView.backgroundColor = UIColor.black
        //3. กำหนด content size ของ scroll view ให้มีขนาดเท่ากับรูปภาพ
        scrollView.contentSize = imageView.bounds.size
        
        //4. กำหนด autoresizingmask  ให้เปลี่ยนทั้งความกว้าง และความสูง เผื่อต้องหมุนโทรศัพท์
        scrollView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        //5. กำหนด offset ว่าเริ่มต้นควรแสดงผลเนื้อหาตำแหน่งไหน
        scrollView.contentOffset = CGPoint(x: 1500,y: 450)
        //6. นำ imageView ใส่เป็น subview ของ scrollView แล้วจึงนำ scrollview ใส่ เข้าไปใน view hierarchy หลักอีกที
        scrollView.addSubview(imageView)
        view.addSubview(scrollView)  // view หลัก
        
        
        
        // เพิ่มให้ zoom ได้
        scrollView.delegate = self
        scrollView.minimumZoomScale  = 0.1
        scrollView.maximumZoomScale  = 4.0
        scrollView.zoomScale = 1.0
        
        //สร้าง ตัวตรวจจับ Gesture ต่างๆ (การ tab)
        let doubleTap = UITapGestureRecognizer(
            target: self,
            action: #selector(doubleTapToZoom))  // method อะไรที่จะถุกเรียก
        
        doubleTap.numberOfTapsRequired  = 2
        scrollView.addGestureRecognizer(doubleTap)
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
}
