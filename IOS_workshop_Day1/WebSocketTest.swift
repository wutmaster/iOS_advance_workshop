//
//  WebSocket.swift
//  IOS_workshop_Day1
//
//  Created by Piyawut on 2/24/2560 BE.
//  Copyright © 2560 Piyawut Thongsang. All rights reserved.
//


//
//  ImageLoader.swift
//  IOS_workshop_Day1
//
//  Created by Piyawut on 2/24/2560 BE.
//  Copyright © 2560 Piyawut Thongsang. All rights reserved.
//

import Alamofire
import UIKit
import Starscream

class WebSocketTest: UIViewController, WebSocketDelegate {
    
    
 
    @IBOutlet weak var sendMsg: UIButton!
    @IBOutlet weak var disconnectBtn: UIButton!
    
    //TODO 
    // start ws-server.rb
//    Opent test.html to test socket
    
    var socket = WebSocket(url: URL(string: "ws://localhost:8080/")!)
    override func viewDidLoad() {
        super.viewDidLoad()
        socket.delegate = self
        socket.connect()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Websocket Delegate Methods.
    
    func websocketDidConnect(socket: WebSocket) {
        print("websocket is connected")
    }
    
    func websocketDidDisconnect(socket: WebSocket, error: NSError?) {
        if let e = error {
            print("websocket is disconnected: \(e.localizedDescription)")
        } else {
            print("websocket disconnected")
        }
    }
    
    func websocketDidReceiveMessage(socket: WebSocket, text: String) {
        print("Received text: \(text)")
    }
    
    func websocketDidReceiveData(socket: WebSocket, data: Data) {
        print("Received data: \(data.count)")
    }
    
    // MARK: Write Text Action
    
    @IBAction func writeText(sender: UIButton) {
        socket.write(string: "{\"food\" : \"burger\"}")
    }
    
    // MARK: Disconnect Action
    
    @IBAction func disconnect(sender: UIButton) {
        if socket.isConnected {
            sender.setTitle("Connect", for: .normal)
            socket.disconnect()
        } else {
            sender.setTitle("Disconnect", for: .normal)
            socket.connect()
        }
    }
    
   
    
}
