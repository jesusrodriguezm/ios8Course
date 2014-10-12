// Playground - noun: a place where people can play

import UIKit

typealias WholeNumber = Int
typealias NumberWithDecmial = Double

var x:WholeNumber = 49
var y = 10

var additionAnswer = x + y
var multiplicationAnswer = x * y
var substractionAnswer = x - y
var divisionAnswer = x / y
var moduleAnswer = x % y

var discountOnShoesAtStore = 0.3
var priceOfShoes:NumberWithDecmial = 33

var priceAfterDiscount = priceOfShoes * (1.0 - discountOnShoesAtStore)
var downPayment = 10.5

priceAfterDiscount -= downPayment

var z = 33
z = 44

var largeNumber = 1_000_000_000_000