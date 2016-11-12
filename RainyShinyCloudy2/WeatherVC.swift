//
//  WeatherVC.swift
//  RainyShinyCloudy2
//
//  Created by Joy Umali on 11/8/16.
//  Copyright © 2016 Joy Umali. All rights reserved.
//

import UIKit
import Alamofire

class WeatherVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var currentTempLabel: UILabel!
    
    @IBOutlet weak var locationLabel: UILabel!
    
    @IBOutlet weak var currentWeatherImage: UIImageView!

    @IBOutlet weak var currentWeatherTypeLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    var currentWeather = CurrentWeather() //creates generic class of CurrentWeather
    var forecasts = [Forecast]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        
//        print(CURRENT_WEATHER_URL)
        
        currentWeather = CurrentWeather()
        
        currentWeather.downloadWeatherDetails {
            self.updateMainUI() // calling self because within a closure??
        }
    }
    
    func downloadForecastData(completed: @escaping DownloadComplete) {
        //Downloading our forecast weather data for TableView
        let forecastURL = URL(string: FORECAST_URL)!
        Alamofire.request(forecastURL).responseJSON { response in
            let result = response.result

            //<key, value> where the key is a string and the values come in a variety of types.
            if let dict = result.value as? Dictionary<String, AnyObject> {
                
                if let list = dict["list"] as? [Dictionary<String, AnyObject>] {
                    
                    // lowTemp and highTemp for each day. For every forecast, putting it into another dictionary                    
                    for obj in list { // parses through the data and places in weatherDict which is created in Forecast Class
                        let forecast = Forecast(weatherDict: obj)
                        self.forecasts.append(forecast)
                    }
                }
            }
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath)
        
        return cell
    }
    
    func updateMainUI() {
        // text for IBOutlets...
        // IBOutletname.text = currentWeather.variablenametype...
         
        dateLabel.text = currentWeather.date
        currentTempLabel.text = "\(currentWeather.currentTemp!)"
        currentWeatherTypeLabel.text = currentWeather.weatherType
        locationLabel.text = currentWeather.cityName
        currentWeatherImage.image = UIImage(named: currentWeather.weatherType!) // same name as the currentWeatherTypeLabel
    }


}

