//
//  Date.swift
//  WeatherApp1
//
//  Created by Mantiz on 11/05/23.
//

import Foundation
struct DateFormat {
    func currentDate()-> String{
        let date = Date()
        let format = "EEEE-dd-MMM-yyyy"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format

        return dateFormatter.string(from: date)
    }
}
