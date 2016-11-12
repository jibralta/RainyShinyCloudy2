//
//  Forecast.swift
//  RainyShinyCloudy2
//
//  Created by Joy Umali on 11/11/16.
//  Copyright © 2016 Joy Umali. All rights reserved.
//

import UIKit
import Alamofire

class Forecast {
    
    //coming from the data from our UI...
    
    var date: String?
    var weatherType: String?
    var highTemp: String?
    var lowTemp: String?
    
//    var _date: String!
//    var _weatherType: String!
//    var _highTemp: String!
//    var _lowTemp: String!
//    
//    
//    // these functions below make these variables safe by checking if it is empty.  If it is empty, it will return an empty string.
//    var date: String {
//        if _date == nil {
//            _date = ""
//        }
//        return _date
//    }
//    
//    var weatherType: String {
//        if _weatherType == nil {
//            _weatherType = ""
//        }
//        return _weatherType
//    }
//    
//    var highTemp: String {
//        if _highTemp == nil {
//            _highTemp = ""
//        }
//        return _highTemp
//    }
//    
//    var lowTemp: String {
//        if _lowTemp == nil {
//            _lowTemp = ""
//        }
//        return _lowTemp
//    }
    
    // create initalizer to pull forecast data from Forecast Class and run it through and set all the values into the UI
    init(weatherDict: Dictionary<String, AnyObject>) {
        
        if let temp = weatherDict["temp"] as? Dictionary<String, AnyObject> {
        
            if let min = temp["min"] as? Double {
                let kelvinToFarenheitPreDivision = (min * (9/5) - 459.67)
                let kelvinToFarenheit = Double(round(10 * kelvinToFarenheitPreDivision/10))
                self.lowTemp = "\(kelvinToFarenheit)"
                print(self.lowTemp!)
            }
        
            if let max = temp["max"] as? Double {
                let kelvinToFarenheitPreDivision = (max * (9/5) - 459.67)
                let kelvinToFarenheit = Double(round(10 * kelvinToFarenheitPreDivision/10))
                self.highTemp = "\(kelvinToFarenheit)"
                print(self.highTemp!)
            }
        }
        
        // weatherType
        if let weather = weatherDict["weather"] as? [Dictionary<String, AnyObject>] {
            if let main = weather[0]["main"] as? String {
                self.weatherType = main.capitalized
                print(self.weatherType!)
            }
        }
        
        // day of the week
        if let date = weatherDict["dt"] as? Double {
            
            let unixConvertedDate = Date(timeIntervalSince1970: date)
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .full
            dateFormatter.dateFormat = "EEEE"
            dateFormatter.timeStyle = .none
            self.date = unixConvertedDate.dayOfTheWeek()
        }
    }
}

//Day of the week. Function allows us to get the day of the week from the date.

extension Date { // extensions need to be built outside of the class.
    func dayOfTheWeek() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from:self) // using self because it comes from this view controller and not from somewhere else.
    }
}





