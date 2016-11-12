//
//  WeatherCell.swift
//  RainyShinyCloudy2
//
//  Created by Joy Umali on 11/12/16.
//  Copyright © 2016 Joy Umali. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {
    
    @IBOutlet weak var weatherIcon: UIImageView!
    
    @IBOutlet weak var dayLabel: UILabel!
    
    @IBOutlet weak var weatherType: UILabel!

    @IBOutlet weak var highTemp: UILabel!
    
    @IBOutlet weak var lowTemp: UILabel!
    
    
    func configureCell(forecast:Forecast) { // grab the property values from the Forecast Class.
        lowTemp.text = "\(forecast.lowTemp!)"
        highTemp.text = "\(forecast.highTemp!)"
        weatherType.text = forecast.weatherType
        dayLabel.text = forecast.date
        weatherIcon.image = UIImage(named: forecast.weatherType!)
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }


}
