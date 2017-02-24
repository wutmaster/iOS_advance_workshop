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
    
    var json:JSON!
    @IBOutlet weak var search: UIButton!
    @IBOutlet weak var Name: UILabel!
    @IBOutlet weak var height: UILabel!
    @IBOutlet weak var weight: UILabel!
  
    @IBOutlet weak var searchInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
//        let json = JSON(["name":"Jack","age":"25"])
//        print("json val=\(json) \n")
//        print(json["name"].stringValue)
//        print(json["age"].intValue)
//        
//        if let address = json["address"].string{
//            print(address)
//        }else{
//            print(json["address"].error ?? "unknown")
//        }
        

        
        
     }
  
    
    func loadData(){
        
        guard let path = Bundle.main.path(forResource: "avengers", ofType: "json")
            else{
                print("retrun error exit 1")
                return
            }
        guard let data = NSData(contentsOfFile: path)
            else{
                print("retrun error exit 2")
                return
            }
        self.json = JSON(data: data as Data)
        
        print(json)
    }
    
    
    @IBAction func searchDisplay(){
    
//        var found = false
//        for ((_, subJson):(String,JSON)) in json{
//            
//        }
        
        
        
    }
    
    
}
