//
//  ImageLoader.swift
//  IOS_workshop_Day1
//
//  Created by Piyawut on 2/24/2560 BE.
//  Copyright © 2560 Piyawut Thongsang. All rights reserved.
//


import UIKit
import Alamofire

class ImageLoader: UIViewController {
    
    
    
    @IBOutlet weak var fileUrl: UITextField!
    @IBOutlet weak var loadBtn: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    
    @IBAction func loadImage(_ sender: Any) {
        
        let fileUrlvar = fileUrl.text!
        print(fileUrlvar)
        Alamofire.request(self.fileUrl.text!)
            .responseData(completionHandler: {(data) in let img = UIImage(data: data.data!)
                print("file img=\(img)")
                self.imageView.image = img
        })
    }
    
}
