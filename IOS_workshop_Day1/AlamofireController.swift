//
//  AlamofireController.swift
//  IOS_workshop_Day1
//
//  Created by Piyawut on 2/24/2560 BE.
//  Copyright © 2560 Piyawut Thongsang. All rights reserved.
//

import Foundation


//
//  SwiftyJSON.swift
//  IOS_workshop_Day1
//
//  Created by Piyawut on 2/24/2560 BE.
//  Copyright © 2560 Piyawut Thongsang. All rights reserved.
//
import SwiftyJSON
import UIKit
import Alamofire

class AlamofireController: UIViewController {
    
    var json:JSON!

    
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
        
    }
    
    
    @IBAction func conectHTTPGet(){
        
        Alamofire.request("https://httpbin.org/get", parameters: ["foo":"bar"])
            
            // ถ้า  response มาเป็น JSON ให้ทำอะไรต่อ
            .responseJSON{ response in
                print("1--------")
                debugPrint(response)

                print("2--------")
                print(response.result)  //result of response serialization
                print("3--------")

                if let jsonvalue = response.result.value{
                    print("JSON: \(jsonvalue)")
                }

        }
        
    }
    
    @IBAction func conectHTTPPost(){
        
        Alamofire.request("https://httpbin.org/get", method: .post ,parameters: ["foo":"bar"])
            
            // ถ้า  response มาเป็น JSON ให้ทำอะไรต่อ
            .responseJSON{ response in
                print("1--------")
                debugPrint(response)
                
                print("2--------")
                print(response.result)  //result of response serialization
                print("3--------")
                
                if let jsonvalue = response.result.value{
                    print("JSON: \(jsonvalue)")
                }
                
        }
        
    }
    
    @IBAction func conectHTTPAuth(){
        
        let user = "user"
        let pwd = "passwd"
        Alamofire.request("https://httpbin.org/basic-auth/user/passwd")
            .authenticate(user: user, password: pwd)
            // ถ้า  response มาเป็น JSON ให้ทำอะไรต่อ
            .responseJSON{ response in
                print("1--------")
                debugPrint(response)
                
                print("2--------")
                print(response.result)  //result of response serialization
                print("3--------")
                
                if let jsonvalue = response.result.value{
                    print("JSON: \(jsonvalue)")
                }
                
        }
        
    }
    
    
}
