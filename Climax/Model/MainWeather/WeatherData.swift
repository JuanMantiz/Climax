//
//  WeatherData.swift
//  Climax
//
//  Created by Mantiz on 29/03/23.
//

import Foundation

struct WeatherData: Codable {
    let name: String
    let main: Main
    let wind: Wind
    let coord: Coord
    let weather: [Weather]
    let sys: Sys
}

struct Main: Codable {
    let temp: Double
    let humidity: Int
    let feels_like: Double
    let temp_min: Double
    let temp_max: Double
}

struct Wind: Codable{
    let speed: Double
}

struct Coord: Codable {
    let lon: Double
    let lat: Double
}

struct Weather: Codable {
    let id: Int
    let main: String
}

struct Sys: Codable {
    let country: String
}
