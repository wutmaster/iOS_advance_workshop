//
//  ChatWebsocket.swift
//  IOS_workshop_Day1
//
//  Created by Piyawut on 2/24/2560 BE.
//  Copyright © 2560 Piyawut Thongsang. All rights reserved.
//

//
//  ViewController.swift
//  WebSocketChat
//
//  Created by Thongrop Rodsavas on 1/28/16.
//  Copyright © 2016 LearningProject. All rights reserved.
//

import UIKit
import Starscream
import SwiftyJSON

class ChatWebsocket: UIViewController, UITextFieldDelegate {
    
    
//    @IBOutlet weak var usernameLabel: UILabel!
//    @IBOutlet weak var input: UITextField!
//    @IBOutlet weak var chatTextView: UITextView!
//    var socket = WebSocket(url: NSURL(string: "ws://localhost:8080/")! as URL)
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view, typically from a nib.
//        
//        chatTextView.text = ""
//        // TODO: 1. setup websocket แล้วเชื่อมต่อกับ server
//        // -- your code --
//        socket.delegate = self
//        socket.connect()
//    }
//    
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//    
//    // MARK: Websocket Delegate Methods.
//    
//    func websocketDidConnect(socket: WebSocket) {
//        
//    }
//    
//    func websocketDidDisconnect(socket: WebSocket, error: NSError?) {
//        if let e = error {
//            printToChatScreen(s: "websocket is disconnected: \(e.localizedDescription)")
//        } else {
//            printToChatScreen(s: "websocket disconnected")
//        }
//    }
//    
//    
//    func websocketDidReceiveMessage(socket: WebSocket, text: String) {
//        print(text)
//        if let dataFromString = text.data(
//            using: String.Encoding.utf8,
//            allowLossyConversion: false) {
//            
//            let json = JSON(data: dataFromString)
//            // ---------------------------------------
//            // TODO: 2. คำสั่ง join
//            //      - เช็คว่า join สำเร็จหรือไม่
//            //      - ถ้าสำเร็จ เปลี่ยน username เป็นอันใหม่
//            //      - เคลียร์ข้อความบนหน้าจอแช็ตทั้งหมด
//            // ---------------------------------------
//            // -- your code --
//            if json["cmd"] == "join"{
//                if json["success"].boolValue == true{
//                    self.usernameLabel.text = json["username"].stringValue
//                    self.chatTextView.text = ""
//                }
//            }
//            // ---------------------------------------
//            // TODO: 3. คำสั่ง message
//            //      - นำข้อความมาแสดงผลบนหน้าจอ
//            // ---------------------------------------
//            // -- your code --
//            if json["cmd"] == "message"{
//                printToChatScreen(s: json["message"].stringValue)
//            
//        }
//    }
//    
//    func websocketDidReceiveData(socket ws: WebSocket, data: Data) {
//        printToChatScreen(s: "Received data: \(data.count)")
//    }
//    
//    // MARK: Write Text Action
//    
//    @IBAction func writeText(sender: UIButton) {
//        sendText()
//    }
//    
//    func sendText(){
//        // TODO: 4. ส่งข้อมูลไปยัง server
//        // -- your code --
//        guard let text = input.text else{
//            return
//        }
//        guard  text != "" else{
//            return
//        }
//        
//        let message = ["cmd":"chat","message":text]
//        let json = JSON(message)
//        socket.write(String: json.rawString()!)
//        
//        
//        socket.write(string: json.rawString()!)
//        // เมื่อส่ง text เสร็จแล้ว เคลียร์ text field และซ่อน keyboard
//        input.text = ""
//        self.view.endEditing(true)
//    }
//    
//    // MARK: Disconnect Action
//    
////    @IBAction func disconnect(sender: UIBarButtonItem) {
////        if socket.isConnected {
////            sender.title = "Connect"
////            socket.disconnect()
////        } else {
////            sender.title = "Disconnect"
////            socket.connect()
////        }
////    }
//    
//    
//    func printToChatScreen(s:String)
//    {
//        chatTextView.text.append("\n\(s)")
//        // Update scroll position
//        let bottom = NSMakeRange(chatTextView.text.characters.count, 0)
//        chatTextView.scrollRangeToVisible(bottom)
//        chatTextView.isScrollEnabled = false
//        chatTextView.isScrollEnabled = true
//    }
//    
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        self.sendText()
//        return true
//    }


}
