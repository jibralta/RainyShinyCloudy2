//
//  Location.swift
//  RainyShinyCloudy2
//
//  Created by Joy Umali on 11/12/16.
//  Copyright © 2016 Joy Umali. All rights reserved.
//

import CoreLocation

class Location {
    
    // static vars are accessible throughout the file.
    static var sharedInstance = Location()
    private init() {}
    
    var latitude: Double?
    var longitude: Double?
    

}
