//
//  SwiftyJSON.swift
//  IOS_workshop_Day1
//
//  Created by Piyawut on 2/24/2560 BE.
//  Copyright © 2560 Piyawut Thongsang. All rights reserved.
//
import SwiftyJSON
import UIKit

class SwiftyJSON: UIViewController {
    
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let json = JSON(["name":"Jack","age":"25"])
        print("json val=\(json)")
        print(json["name"].stringValue)
        print(json["age"].intValue)
        
        if let address = json["address"].string{
            print(address)
        }else{
            print(json["address"].error ?? "unknown")
        }
        

        
        
     }
}
