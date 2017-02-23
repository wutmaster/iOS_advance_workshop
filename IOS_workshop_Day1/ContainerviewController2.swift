//
//  ContainerViewController.swift
//  IOS_workshop_Day1
//
//  Created by Piyawut on 2/22/2560 BE.
//  Copyright © 2560 Piyawut Thongsang. All rights reserved.
//

import Foundation
import UIKit



class ContainerViewController2: UIViewController  {
    
    @IBOutlet var sideMenuRightConstraint:NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    func showSideMenu(){
        
        UIView.animate(withDuration: 0.5, animations:
            {self.sideMenuRightConstraint.constant = -20
                self.view.layoutIfNeeded()}
        )
    }
    
    func hideSideMenu(){
        
        UIView.animate(withDuration: 0.5, animations:
            {self.sideMenuRightConstraint.constant = -999
                self.view.layoutIfNeeded()}
        )
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
    }
    
    @IBAction func toggleSideMenu(_ sender: Any) {
        
        self.view.layoutIfNeeded()
        if(self.sideMenuRightConstraint.constant < -20)
        {
            showSideMenu()
            
        }else{
            hideSideMenu()
        }
    }
    
    
    @IBAction func retrunToMainScreen(_ segue: UIStoryboardSegue) {
        
        hideSideMenu()
        print("Return to main Screen")
    }
    
    
    
    
    
    
}




