//: Playground - noun: a place where people can play

import UIKit
import Foundation

let todaydate : NSDate = NSDate()
let dateFormatter = DateFormatter()
dateFormatter.dateFormat = "MMMM dd, yyyy"
print(dateFormatter.string(from: todaydate as Date))

