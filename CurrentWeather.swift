//
//  CurrentWeather.swift
//  RainyShinyCloudy2
//
//  Created by Joy Umali on 11/8/16.
//  Copyright © 2016 Joy Umali. All rights reserved.
//

//stores all the variables that keep track of our weather data

import UIKit
import Alamofire

class CurrentWeather {
    
    // instantiate
    var cityName: String?
    var weatherType: String?
    var currentTemp: Double?
    var _date: String!
    
    var date: String {
        if _date == nil {
            _date = ""
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        let currentDate = dateFormatter.string(from: Date())
        self._date = "Today, \(currentDate)"
        return _date
    }

    
    func downloadWeatherDetails(completed: @escaping DownloadComplete) {
        //initialize url to tell alamofire where to download from
        let currentWeatherURL = URL(string: CURRENT_WEATHER_URL)!
        Alamofire.request(currentWeatherURL).responseJSON { response in
            let result = response.result
            
            print("***\(response)") //if ask to print result, if successful, would print SUCCESS only. Response would include data after SUCCESS.
            
            if let dict = result.value as? Dictionary<String, AnyObject> {
                // looks for the key in the dictionary that we want
                
                if let name = dict["name"] as? String {
                    self.cityName = name.capitalized
                    print(self.cityName!)   // need self because inside of a closure.
                    
                }   // tells function to search through the dictionary and find the key called name and pass the value as a string.
                
                if let weather = dict["weather"] as? [Dictionary<String, AnyObject>] {
                    if let main = weather[0]["main"] as? String { // The zero if for the first dictionary in the weather array
                        self.weatherType = main.capitalized
                        print(self.weatherType!)
                    }
                }
                
                if let main = dict["main"] as? Dictionary<String, AnyObject> {
                    if let currentTemperature = main["temp"] as? Double {
                        let kelvinToFarenheitPreDivision = (currentTemperature * (9/5) - 459.67)
                        let kelvinToFarenheit = Double(round(10 * kelvinToFarenheitPreDivision/10))
                        self.currentTemp = kelvinToFarenheit
                        print(self.currentTemp!)
                        }
                    }
                }
                
            completed() // tells it when its done and the app will finish.
        }
        
    }
}


