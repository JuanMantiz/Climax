//
//  ForecastModel.swift
//  Climax
//
//  Created by Mantiz on 17/04/23.
//

import Foundation

struct ForecastModel {
    var forecastTemperature1: Float
    var forecastTemperature2: Float
    var forecastTemperature3: Float
    var forecastTemperature4: Float
    var forecastTemperature5: Float
    
    let conditionId1: Int
    let conditionId2: Int
    let conditionId3: Int
    let conditionId4: Int
    let conditionId5: Int
    
    var forecasteTemperatureString1: String{
        let myInt = Int(forecastTemperature1)
        return String(myInt)
    }
    var forecasteTemperatureString2: String{
        let myInt = Int(forecastTemperature2)
        return String(myInt)
    }
    var forecasteTemperatureString3: String{
        let myInt = Int(forecastTemperature3)
        return String(myInt)
    }
    var forecasteTemperatureString4: String{
        let myInt = Int(forecastTemperature4)
        return String(myInt)
    }
    var forecasteTemperatureString5: String{
        let myInt = Int(forecastTemperature5)
        return String(myInt)
    }
    
    var conditionName1: String {
        var weatherCondition: String
        switch conditionId1 {
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
    
    var conditionName2: String {
        var weatherCondition: String
        switch conditionId2 {
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
    
    var conditionName3: String {
        var weatherCondition: String
        switch conditionId2 {
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
    
    var conditionName4: String {
        var weatherCondition: String
        switch conditionId4 {
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
    
    var conditionName5: String {
        var weatherCondition: String
        switch conditionId5 {
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
