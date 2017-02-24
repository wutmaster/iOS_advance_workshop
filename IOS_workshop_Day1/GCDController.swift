//
//  MultitaskController.swift
//  IOS_workshop_Day1
//
//  Created by Piyawut on 2/23/2560 BE.
//  Copyright © 2560 Piyawut Thongsang. All rights reserved.
//

import Foundation
import UIKit


class GCDController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    @IBAction func startCounting(){
        DispatchQueue.global(qos: DispatchQoS.QoSClass.default).async  {
            () -> Void in
            for i in 0...100000 {
                print("\(i)")
            }
        }
        
    }
    
   //    Multitasking thread
//    @IBAction func startCounting(){
//        
//        let queue = OperationQueue()
//        if operation1 == nil {
//            operation1 = BlockOperation{ () -> Void in
//                for i in 0...100000 {
//                    print("\(i)")
//                }
//            }
//        }
//        operation1!.completionBlock = { () -> Void in
//            print("Finished Counting Up")
//            self.operation1 = nil
//        }
//    }
    
    


    
//    @IBAction func startCounting(){
//        let queue = OperationQueue()
//        let operation = BlockOperation { () -> Void in
//        for i in 0...100000
//        {
//            print(" \(1)")
//        }
//        }
//        
//        queue.addOperation (operation)
//    }
    
    var operation1:BlockOperation?
    var operation2:BlockOperation?
    
    @IBAction func cancel(){
        
        if let operation = operation2 {
            operation.cancel()
        }
    }
    
    

}

