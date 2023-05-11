//
//  ForecastData.swift
//  WeatherApp1
//
//  Created by Mantiz on 17/04/23.
//

import Foundation

struct ForecastData: Codable {
    let list: [Item]
}

struct Item: Codable {
    let main: MainForecast
    let weather: WeatherForecast
}
struct MainForecast: Codable {
    let temp: Double
}
struct WeatherForecast: Codable{
    let id: Int
}
