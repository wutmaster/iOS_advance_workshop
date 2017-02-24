//
//  BaclgroundController.swift
//  IOS_workshop_Day1
//
//  Created by Piyawut on 2/24/2560 BE.
//  Copyright © 2560 Piyawut Thongsang. All rights reserved.
//
import UIKit

class BlackgroundController: UIViewController{
    
    var backgroundTask: UIBackgroundTaskIdentifier = UIBackgroundTaskInvalid
    
    func regiserBackgroundTask(){
        //UIApplication เป็น classที่เป็นตัวแทนทั้ง app โดยเรียกผ่าน .share   โดยส่ง beginBackgroundTask  
//        เพื่อบอก OS ว่าเรากำลังจะทำงานเบื้องหลังเพิ่ม
        self.backgroundTask = UIApplication.shared.beginBackgroundTask { [weak self] in
            self?.endBackgroundTask()
        }
    }
    // ตอน จบ background task จะต้องส่งตัวเลข (บัตรคิว)ไปบอก os
    func endBackgroundTask(){
        print("Background Task Ended.")
        UIApplication.shared.endBackgroundTask(backgroundTask)
        backgroundTask = UIBackgroundTaskInvalid
    }
    
    
    @IBAction func onClick(){
        
        self.regiserBackgroundTask()
        DispatchQueue.global(qos: DispatchQoS.QoSClass.default).async{
            ()-> Void in
            for i in 0...100000{
                switch UIApplication.shared.applicationState{
                case .active:
                        print("\(i)")
                case .background:
                        print("App is background. Next number = \(i)")
                        print("Backgroun time remaining= \(UIApplication.shared.backgroundTimeRemaining) seconds")
                case .inactive:
                        print("Inactive")
                        break
                }
            }
            if self.backgroundTask != UIBackgroundTaskInvalid{
                self.endBackgroundTask()
            }
            
        }
        
    }
    
}
