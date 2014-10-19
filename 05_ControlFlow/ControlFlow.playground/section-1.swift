// Playground - noun: a place where people can play

import UIKit

let truckSpeed = 45
let lamboSpeed = 120
var mySpeed:Int
mySpeed = 101
var myFriendsSpeed = 0

if mySpeed < 70 || myFriendsSpeed >= 90 {
    println("Keep Crousing")
}
else if (mySpeed < 90) {
    println("My friend's not on the road anymore but i', going fast!")
}
else if (mySpeed>100) {
    println("I'm going really fast")
}
else {
    println("Slow down police ahead")
}

let isTelevisionOn = false

if isTelevisionOn != true {
    println("Make sure to turn it off when you are done")
}
else {
    println("Do you want to use this now?")
}
