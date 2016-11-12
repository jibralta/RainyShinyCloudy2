//
//  Constants.swift
//  RainyShinyCloudy2
//
//  Created by Joy Umali on 11/8/16.
//  Copyright © 2016 Joy Umali. All rights reserved.
//

import Foundation

let BASE_URL = "http://api.openweathermap.org/data/2.5/weather?"
let LATITUDE = "lat="
let LONGITUDE = "&lon="
let APP_ID = "&appid="
let API_KEY = "acffbb0fbf930c87e84547ba3aa32936"

typealias DownloadComplete = () -> ()
// this tells our function when we are complete, when we are finished downloading.



let CURRENT_WEATHER_URL = "\(BASE_URL)\(LATITUDE)-36\(LONGITUDE)123\(APP_ID)\(API_KEY)"

let FORECAST_URL = "http://api.openweathermap.org/data/2.5/forecast/daily?lat=-36&lon=123&cnt=10&mode=json&appid=acffbb0fbf930c87e84547ba3aa32936"
