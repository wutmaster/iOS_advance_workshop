//
//  AlertController.swift
//  IOS_workshop_Day1
//
//  Created by Piyawut on 2/22/2560 BE.
//  Copyright © 2560 Piyawut Thongsang. All rights reserved.
//
import UIKit

class AlertController: UIViewController {
    
    
    
    @IBAction func alertAction(_ sender: Any) {
        
        // 1 - Alert Controller โดยกำหนดค่าเริ่มต้นและสไล์
        let alertController =  UIAlertController(
            title: "Default Style",
            message: "A Standard Alert",
            preferredStyle: .alert
        )
        
        
        // / - Alert Controller โดยกำหนดค่าเริ่มต้นและสไล์
        let cancelAction =  UIAlertAction(
            title: "Cancel",
            style: .cancel){ (action) in
                print("Cancel clicked. \(action)")
        }
        alertController.addAction(cancelAction)
        
        //3 - สร้าง Action ที่สองขึ้นมาพร้อมตั้งชื่อปุ่มและสไล์
        let OKAction = UIAlertAction(
            title: "OK",
            style: .default){ (action) in
                print("OK Clicked \(action)")
        }
        alertController.addAction(OKAction)
        
        
        //4 - สั่งให้ view controller แสดง alert controller พร้อม อนิเมชั่น
        self.present(alertController, animated: true){
            print("Finished showing standard Alert")
        }
        
    }
    
    
   
   
    @IBAction func standardAlert() {
        
        // 1 - Alert Controller โดยกำหนดค่าเริ่มต้นและสไล์
        let alertController =  UIAlertController(
            title: "Default Style",
            message: "A Standard Alert",
            preferredStyle: .alert
        )
        
        
        // / - Alert Controller โดยกำหนดค่าเริ่มต้นและสไล์
        let cancelAction =  UIAlertAction(
            title: "Cancel",
            style: .cancel){ (action) in
                print("Cancel clicked. \(action)")
        }
        alertController.addAction(cancelAction)
        
        //3 - สร้าง Action ที่สองขึ้นมาพร้อมตั้งชื่อปุ่มและสไล์
        let OKAction = UIAlertAction(
            title: "OK",
            style: .default){ (action) in
            print("OK Clicked \(action)")
        }
        alertController.addAction(OKAction)
   
    
        //4 - สั่งให้ view controller แสดง alert controller พร้อม อนิเมชั่น
            self.present(alertController, animated: true){
                print("Finished showing standard Alert")
        }

     }
    
    
    @IBAction func loginAction(_ sender: Any) {
        
        let alertController = UIAlertController(
            title: "Login Form",
            message: "Please Enter login information",
            preferredStyle: .alert
        )
        
        let loginAction = UIAlertAction(
        title: "Login", style: .default) { (_) in
            
            let loginTextField = alertController.textFields![0] as UITextField
            let passwordTextField = alertController.textFields![1] as UITextField
            print(" \(loginTextField.text)  \(passwordTextField.text)")
        
        }
        loginAction.isEnabled  = true
        
        let forgotPasswordAction = UIAlertAction(title: "Forgot Password", style: .destructive) { (_) in}
        let cancelAction  = UIAlertAction(title: "Cancel", style: .cancel ) { (_) in}
        
        alertController.addTextField { (textfield) in
            textfield.placeholder = "Login"
        }
        alertController.addTextField{ (textfield) in
            textfield.placeholder = "Password"
            textfield.isSecureTextEntry = true
        }
        
         alertController.addAction(loginAction)
         alertController.addAction(forgotPasswordAction)
         alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true){
            print("Finishted Showing login form alert")
        }
        
    }
    
    
    
    @IBAction func signUpFormAction(_ sender: Any) {
        
        let alertController = UIAlertController(
            title: "Sign-up Form",
            message: "Please enter sign-up information",
            preferredStyle: .alert
        )
        
        let signupAction = UIAlertAction(
            title: "Sign Up",
            style: .default){ (_) in
                print("Try to Sign-up")
        }
        signupAction.isEnabled = false
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { _ in }
        
        
        alertController.addTextField{ (textfield) in
            textfield.placeholder = "Email"
            textfield.keyboardType = .emailAddress
            
            NotificationCenter.default.addObserver(
                forName: NSNotification.Name.UITextFieldTextDidChange,
                object: textfield,
                queue: OperationQueue.main){
                        (notification) in
                    signupAction.isEnabled = textfield.text != ""
                    print("signupAction.isEnabled")
            }
            
        
        }

        alertController.addTextField{ (textfield) in
            textfield.placeholder = "Password"
            textfield.isSecureTextEntry = true }
        alertController.addTextField{ (textfield) in
            textfield.placeholder = "Password Confirmation"
            textfield.isSecureTextEntry = true }
        
        alertController.addAction(cancelAction)
        alertController.addAction(signupAction)
        
        
        
        
        self.present(alertController, animated: true){
            print("Finishted Showing Sign-up form alert")
        }
        
    }
    
    
    
    
    
    
}
