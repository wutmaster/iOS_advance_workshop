//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


//////////////  DAY 1 \\\\\\\\\\\\\\\\\\\\\


//(funtional programming) MAP another value to list
var numbers = [1,2,3]
var strings  =  numbers.map({
    val in return "\(val)"
})  //trailing cl
numbers
strings

//Filter
var numbersFilter = [1,2,3,4,5,6,7,8]
var evenNumber = numbersFilter.filter{$0 % 2 == 0}
evenNumber

//Reduce combine value into one value (SUM)
var numbersReduce = [1,2,3]
var evenReduce = numbersReduce.reduce(0){$0 + $1}
evenReduce


// Execise1

func repeatXTimes(X: Int, _ closure: ()->()){
    
    for i in 1...X {   //Can replace i to _ เพื่อกันการประกาศตัวแปรที่ไม่ได้ใช้งาน
        closure()
    }
}

repeatXTimes(X: 3)
{
    print("repeatXTimes")
}


// Execise2 Join
let Strings = ["I" ,"Like","Pizza"]
var reduceStr = Strings.reduce(""){"\($0) \($1)" }
reduceStr


//Execise3 For Each

func forEach(array: [Int], _ closure: (Int) -> ()){
    //    var strings  =  array.map({ val in return closure(val) })
    for i in array {
        closure(i)
    }
}
var array = [1,2,3,4]
//iOS Style (Reduce format)
print("=== iOS Style Reduce format  ====")
forEach(array: array){print($0+1) //1+1,2+1,3+1,4+1   //Result1
}
// Original Original Style //Same Result with Result1
print("Original Original Style //Same Result with Result1")
forEach(array: array,{ print(+$0+1)})


//Non-Optional : ไม่มีทางเป็น nil ได้ตั้งแต่แรก
var str1:String = "Hello"
//str= nil

//Optional สามารถให้เป็น nil ได้
// ? ยอมใหั nil ทำงานได้ ถ้ามีค่า จะทำงาน ถ้า ไม่มีค่า ก็จะเป็น nil เลย
// ! force unwrape คือ ดึงค่า ข้างใน ออกมา จาก optional
var str2:String?
str2 = "Hello"
print(str2)
print(str2!)
print(str2?.uppercased())
print(str2!.uppercased())


//Binding Optional
print("//Binding Optional")
var optionalName: String? = "John"  // check ว่าข้อมูลเป็น nil หรือไม่ ถ้าไม่  ให้ print ค่าออกมา
print("Hello, \(optionalName)")
if let name = optionalName{
    print("Hello, \(name)")
}


// การประกาศ ตัวข้อมูล Data type มี 3 แบบ
// 1. Non Optional : ใช้กับข้อมูลที่มั่นใจว่าไม่เป็น nil เท่านั้น
print("1. Non Optional")
var nonOpStr1:String = "Hello"

// 2. Optional : ใช้ในกรณี ที่อาจมีโอกาส เป็น nil ได้
print("2. Optional")
var nonOpStr2:String? = nil
nonOpStr2 = "Hello"
// 3  Auto - Unwrap optional หรือ implicitly Unwrap optional : ใช้ในกรณีี่ตอน run ครั้งแรก ที่ตัวแปรก เป็น nil สักพัก แล้วต่อไปจะมีค่า
// เป็น nil แค่ช่วงแรก แต่พอมีค่าแล้วให้ใช้งานได้เหมือน non-Optional
print("3  Auto - Unwrap optional หรือ implicitly Unwrap optional")
var nonOpStr3:String! = nil
nonOpStr3 = "Hello"
nonOpStr3.uppercased()









//////////////  End DAY 1 \\\\\\\\\\\\\\\\\\\\\


