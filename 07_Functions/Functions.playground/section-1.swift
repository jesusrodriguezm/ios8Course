// Playground - noun: a place where people can play

import UIKit

func printHelloWorld() {
    println("Hello World!")
    println("Hello Class")
    println("---------------------------")
}

printHelloWorld()
printHelloWorld()
printHelloWorld()

func printNumberSupplied(number:Int) {
    println("---------------------------")
    println("The number \(number)")
    println("The number times 3 is \(number * 3)")
    var numberTimesTwo = number * 2
    numberTimesTwo *= 2
    
    
}

printNumberSupplied(4)


func turnOffAppliance(applianceName: String, isOn:Bool) {
    if isOn {
        println("Please turn off the \(applianceName)")
    }
    else {
        println("I actually turned  the \(applianceName) off already")
    }
}

turnOffAppliance("Stove", false)
