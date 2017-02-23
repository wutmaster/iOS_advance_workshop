//
//  ViewController.swift
//  IOS_workshop_Day1
//
//  Created by Piyawut on 2/21/2560 BE.
//  Copyright © 2560 Piyawut Thongsang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var signUp: UIButton!
    @IBOutlet weak var confirmPassword: UITextField!
    
    enum signUpError: Error{
        case Empty
        case pwdShort
        case pwdNotMatch
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        NotificationCenter.default.addObserver(
        self,
        selector: #selector(didEnterBackground),
        name: .UIApplicationDidEnterBackground,
        object: nil)
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(willEnterForeground),
            name: NSNotification.Name.UIApplicationDidEnterBackground,
            object: nil)
        
        
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    func willEnterForeground (_ notification: Notification){
        print("ViewController reveived will enter foreground.")
        
    }
    func didEnterBackground (_ notification: Notification){
        print("ViewController reveived did enter foreground.")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func signUpAction(_ sender: Any) {
        
        do{
            try checkSignUp(userName: userName.text!, password: password.text!, confirmPassword: confirmPassword.text!)
        } catch signUpError.Empty {
            print("Please input UserName")
            alertTxt("Please input UserName")
        }catch signUpError.pwdShort {
            print("Password is less than 7 characters")
            alertTxt("Password is less than 7 characters")
        }catch signUpError.pwdNotMatch {
            print("Password are not matched")
            alertTxt("Password are not matched")
        }
        catch  {
            print("Other Errors")
            alertTxt("Other Errors")
        }
    }
    
    func checkSignUp(userName: String, password: String , confirmPassword : String) throws {
        
        guard userName.characters.count > 0 else{ throw signUpError.Empty}
        guard password.characters.count >= 7 else{ throw signUpError.pwdShort}
        guard password == confirmPassword  else{ throw signUpError.pwdNotMatch}
        
        print("Welcome to System")
    }
    
    func alertTxt(_ message: String){
         print("alertTxt1")
        // 1 - Alert Controller โดยกำหนดค่าเริ่มต้นและสไล์
        let alertController =  UIAlertController(
        title: "Default Style",
        message: "A Standard Alert",
        preferredStyle: .alert
        )
        print("alertTxt2")

        
        // / - Alert Controller โดยกำหนดค่าเริ่มต้นและสไล์
        let cancelAction =  UIAlertAction(
        title: "Cancel",
        style: .cancel){ (action) in
        print("Error= \(message)")
        }
        print("alertTxt3")

        alertController.addAction(cancelAction)
        print("alertTxt4")
        
        self.present(alertController, animated: true){
            print("Finished showing standard Alert")
        }
    }
    
}

