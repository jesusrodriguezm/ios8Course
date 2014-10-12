// Playground - noun: a place where people can play

import UIKit

var string1 = ""
string1 = "Hello"
let string2 = "World"
var helloWorldString = string1 + " " + string2
helloWorldString = helloWorldString.uppercaseString
helloWorldString = helloWorldString.lowercaseString

let firstCharacter = "!"

helloWorldString = helloWorldString + firstCharacter

var x = 5
var newString = "\(x) times " + helloWorldString
var doubleValue = 3.5
var newDoubleString = "\(doubleValue)" + "!"

var numString = "9"
var numStringToInt = numString.toInt()
var optionalToInt = numStringToInt!
optionalToInt += 3

var doubleString = "3.9585"
var doubleValueFromString = Double((doubleString as NSString).doubleValue)
doubleValueFromString = doubleValueFromString + 3.85




