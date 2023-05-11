//
//  ForecastModel.swift
//  WeatherApp1
//
//  Created by Mantiz on 17/04/23.
//

import Foundation

struct ForecastModel {
    var forecastTemperature1: Double
    var forecastTemperature2: Double
    var forecastTemperature3: Double
    var forecastTemperature4: Double
    var forecastTemperature5: Double
    
    let conditionId1: Int
    let conditionId2: Int
    let conditionId3: Int
    let conditionId4: Int
    let conditionId5: Int
    
    var forecasteTemperatureString: String{
        return String(format: "%.1f", forecastTemperature1)
    }
}
