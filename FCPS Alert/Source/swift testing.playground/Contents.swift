//: Playground - noun: a place where people can play

import UIKit
import Foundation

let currentDate = NSDate()

let date = NSDate()






let dayTimePeriodFormatter = DateFormatter()
dayTimePeriodFormatter.dateFormat = "H"


let calendar = NSCalendar.current

let dateString = dayTimePeriodFormatter.string(from: date as Date)
