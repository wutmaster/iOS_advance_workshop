//
//  ContainerViewController.swift
//  IOS_workshop_Day1
//
//  Created by Piyawut on 2/22/2560 BE.
//  Copyright © 2560 Piyawut Thongsang. All rights reserved.
//

import Foundation
import UIKit



class ContainerViewController: UIViewController  {
    
    var horosopeTableVC:HoroscopeResultViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print(sender)
        print(segue.identifier)
        
        guard let identifier = segue.identifier else{
            return
        }
        if identifier == "horoscope_table" {
            
            self.horosopeTableVC = segue.destination as! HoroscopeResultViewController
        }
    }
    
}


