//
//  ForecastData.swift
//  WeatherApp1
//
//  Created by Mantiz on 17/04/23.
//

import Foundation

struct ForecastData: Codable {
    let list: [Forecast]
}

struct Forecast: Codable {
    let main: MainForecast
    let weather: [WeatherElement]
}
struct MainForecast: Codable {
    let temp: Float
}
struct WeatherElement: Codable{
    let id: Int
}
