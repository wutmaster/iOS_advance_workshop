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
        
        self.backgroundTask = UIApplication.shared.beginBackgroundTask { [weak self] in
            self?.endBackgroundTask()
        }
    }
    
    func endBackgroundTask(){
        print("Background Task Ended.")
        UIApplication.shared.endBackgroundTask(backgroundTask)
        backgroundTask = UIBackgroundTaskInvalid
    }
    
}
