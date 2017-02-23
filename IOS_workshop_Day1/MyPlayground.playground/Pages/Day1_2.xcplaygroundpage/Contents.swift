//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

// Type Checking
var array:[Any] = [1,1.5,1.2,5,7  ]
var intCount  = 0
var doubleCount = 0
for item in array{
    if item is Int{
        intCount += 1
    }else if item is Double{
        doubleCount += 1
    }
}
intCount
doubleCount


//Type Casting
class Shape {}
class Square: Shape{}
class Circle: Shape{}


//Initialise objects superclass:subclass
var shape1:Shape = Square()
var shape2:AnyObject = Circle()
var aSquare:Square = Square()

//Cast up (subclass -> superclass)
var aShape = aSquare as Shape  // as คือการ Cast
print(aShape)

//Downcast (superclass -> subclass)
var square = shape1 as? Square  // as? แปลว่า อาจมีข้อผิดพลาดเกิดได้ ซึ่งจะ retrun nil
type(of:square)  //คำสั่ง check type
var circle = shape2 as! Circle   //as! มั่นใจว่ามีค่าแน่นอน ดังนั้น จะไม่มี Optional() ครอบอยู่
type(of:circle)


//Cast down with optional binding
if let mySquare = shape1 as? Square{    //การ Cast shape1 เป็น Square และจะได้ค่าเป็น non optional มาเลย
    print(mySquare)
}

//Access control




// Memory Management
print(" =======   Memory Management ========")

class Student{
    
    var name:String
    init(name:String) {
        self.name = name
    }
    deinit {
        print("\(name) leaves")
    }
}

// String constant : จะไม่ถูกลบ จนกว่า App จะถูก Terminate
let student1 = Student(name: "A")

// String non-optional variable: object จะถูกลบเมื่อ reference ชี้ไปตัวอื่น
var student2:Student = Student(name:"B")
student2 = Student(name: "C")

// Strong optional variable : Object ถูกลบเมื่อ reference ชี้ไปตัวอื่นหรือถูก set เป็น nil
var student3:Student? = Student(name:"D")
student3 = nil

// Weak optional variable : ไม่มีส่วนเกี่ยวข้องว่า object จะถูกลบหรือไม่
//อาจถูลบด้วย strong variable อื่นได้  หรืออาจถูกลบเมื่อไหร่ก็ได้
weak var student4:Student? = Student(name: "E")
student4

//Basic Retail Cycle
class StudentRC{
    
    var pencil: Pencil?
    deinit {
        print("StudentRC leaves")
    }
}

class Pencil{
    
    weak var owner  : StudentRC?  // can add weak for week parameter
    deinit {
        print("Pencil destroyed")
    }
}

var stud1:StudentRC? = StudentRC()
stud1?.pencil = Pencil()
stud1?.pencil?.owner = stud1
stud1 = nil



print(" ======= End  Memory Management ========")



print(" ======= Error Handling ========")
print(" Guard example")

class Drinker {
    var name: String = ""
    var drink : Drink?
    
    func sip(){
        //1
        guard let d = drink else{
            print("You don't have any drink")
            return
        }
        d.sip()
        
    }
    
    init(name: String, drink: Drink?) {
        self.name = name
        self.drink = drink
    }
    
    
}

class Drink{
    var percentRemaining = 100
    var isEmpty: Bool{return percentRemaining <= 0}
    
    func sip(){
        guard percentRemaining > 0 else{
            //2
            print("You drink is empty, order another") // ถ้าเป็น nil ให้ print error ออกมา
            return
        }
        percentRemaining -= 10
        print("Mmmm \(percentRemaining)% left")
    }
}

var pepsi = Drink()
var tom = Drinker(name: "Tom",drink: pepsi)
repeat{
    tom.sip()
    
}while(!pepsi.isEmpty) // ดื่มไปเรื่อยๆ จนกว่าจะหมด


print(" ======= Throw ========")

enum VendingMachineError : Error{
    case InvalidSelection
    case InsufficientFunds(coinsNeeded: Int)
    case OutOfStock
    case OutOfStock2
}
struct Item {
    var price: Int
    var count : Int
}

class VendingMachine{
    // ประกาศ Dictionary
    var inventory = ["Candy Bar": Item(price: 12, count: 1),
                     "Chips": Item(price: 10, count: 4),
                     "Pretzels": Item(price: 7, count: 11)
    ]
    var coinsDeposited  = 0
    func dispenseSnack(snack: String){
        print("Dispensing \(snack)")
        
    }
    
    func vend(itemNamed name: String) throws{
        print(name)
        guard var item = inventory[name] else{
            throw VendingMachineError.InvalidSelection
        }
        
        guard item.count > 0 else{
            throw VendingMachineError.OutOfStock
        }
        
        guard item.price <= coinsDeposited else {
            throw VendingMachineError.InsufficientFunds(coinsNeeded: item.price - coinsDeposited)
        }
        
        coinsDeposited -= item.price
        item.count -= 1
        inventory[name] = item
        dispenseSnack(snack: name)
    }
    
    func vend2(itemNamed name: String) throws{
        print(name)
        guard var item = inventory[name] else{
            throw VendingMachineError.InvalidSelection
        }
        
        guard item.count > 0 else{
            throw VendingMachineError.OutOfStock
        }
        guard item.count > 0 else{
            throw VendingMachineError.OutOfStock2
        }
        
        guard item.price <= coinsDeposited else {
            throw VendingMachineError.InsufficientFunds(coinsNeeded: item.price - coinsDeposited)
        }
        
        coinsDeposited -= item.price
        item.count -= 1
        inventory[name] = item
        dispenseSnack(snack: name)
    }
}


var v1 = VendingMachine()
v1.coinsDeposited = 10

do{
    try v1.vend(itemNamed: "Chips")
    try v1.vend2(itemNamed: "Chips")
}catch VendingMachineError.InvalidSelection{
    print("")
}catch VendingMachineError.OutOfStock {
    print("OutOfStock")
}catch VendingMachineError.InsufficientFunds(let coinsNeeded){
    print("InsufficientFunds \(coinsNeeded)")
}catch {
    print("I don't know")
}

print(" ======= Throwable function ========")

enum EncryptionError: Error{
    case Empty
    case Short
}

func encryptString(input: String,withPassword password: String) throws -> String {
    guard password.characters.count > 0 else{ throw EncryptionError.Empty}
    guard password.characters.count >= 5 else{ throw EncryptionError.Short}
    let encrypted = str + password
    return encrypted
    
    
}

// Use try? to convert the result to optional and discard any error
let ss1 = try? encryptString(input: str, withPassword: "12345")
print(ss1 ?? "nil")
print(type(of:ss1))

//Use try! when you're certain that there is no error calling this method

let ss2 = try! encryptString(input: str, withPassword: "12345")
print(ss2)
print(type(of:ss2))

// Otherwise, you have to wrap it in a do/catch block
do{
    
    let ss = try encryptString(input: str, withPassword: "12345")
    print(ss)
}catch{
    print("Somthing went wrong.")
}

print(" ======= Defer Statement ========")

class Request{
    
    let MAX_RETRIES = 5
    var callCount = 0
    
    func sendRequest(){
        
        defer{ callCount += 1
            //                print ("Defer is working \(callCount)")
        }
        guard callCount < MAX_RETRIES else{
            print("Fail. Called to often.")
            return
        }
        let rand = Int(arc4random_uniform(100)+1)
        guard rand > 70 else{
            print ("Fail.")
            return
        }
        print("Success")
        
    }
}

var r = Request()
for i in 0...7{
    print ("Attempted= \(i+1) : ")
    r.sendRequest()
}

print(" ======= End  Error Handling ========")



