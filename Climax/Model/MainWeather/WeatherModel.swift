//
//  WeatherModel.swift
//  Climax
//
//  Created by Mantiz on 29/03/23.
//

import Foundation

struct WeatherModel {
    let conditionId: Int
    let cityName: String
    let countryName: String
    let weatherMain: String
    var temperature: Double
    var mainHumidity: Int
    var mainFeelsLike: Double
    var tempMin: Double
    var tempMax: Double
    var windSpeed: Double
    var longitude: Double
    var latitude: Double
    
    var temperatureString: String {
        let myInt = Int(temperature)
        return String(myInt)
    }
    var humidityString: String {
        return String(mainHumidity)
    }
    var feelslikeString: String {
        return String(format: "%.1f", mainFeelsLike)
    }
    var tempMinString: String {
        return String(format: "%.1f", tempMin)
    }
    var tempMaxString: String {
        return String(format: "%.1f", tempMax)
    }
    var windSpeedString: String {
        return String(format: "%.1f", windSpeed)
    }
    
    var conditionName: String {
        var weatherCondition: String
        switch conditionId {
        case 200 ... 232: weatherCondition = "thunderStorm"
        case 300 ... 321: weatherCondition = "drizzle"
        case 500 ... 531: weatherCondition = "rain"
        case 600 ... 622: weatherCondition = "snow"
        case 701 ... 781: weatherCondition = "fog"
        case 800: weatherCondition = "sun"
        case 801 ... 804: weatherCondition = "suncloud"
        default: weatherCondition = "suncloud"
        }
        return weatherCondition
    }
}
