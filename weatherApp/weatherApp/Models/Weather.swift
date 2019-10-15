// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let weather = try? newJSONDecoder().decode(Weather.self, from: jsonData)

import Foundation

// MARK: - Weather
struct Weather: Codable {
    let timezone: String?
    let daily: Daily?
    var fixedName: String? {
        let split = timezone?.components(separatedBy: "/")
        guard split?[1] != nil else { return ""}
        let city = split?[1].replacingOccurrences(of: "_", with: " ")
        return city
    }
    
    
    static func getForecastFromData(data: Data) throws -> Weather? {
        do {
            let info = try JSONDecoder().decode(Weather.self, from: data)
            return info
    
        } catch {
            print(error)
            return nil
        }
    
    }

}




// MARK: - Daily
struct Daily: Codable {
    let summary: String?
    let data: [DailyDatum]?
    
}

// MARK: - DailyDatum
struct DailyDatum: Codable {
    let time: Int?
    let summary: String?
    let sunriseTime, sunsetTime: Int?
    let moonPhase, precipIntensity, precipIntensityMax: Double?
    let precipIntensityMaxTime: Int?
    let precipProbability: Double?
    let temperatureHigh: Double?
    let temperatureHighTime: Int?
    let temperatureLow: Double?
    let temperatureLowTime: Int?
    let apparentTemperatureHigh: Double?
    let apparentTemperatureHighTime: Int?
    let apparentTemperatureLow: Double?
    let apparentTemperatureLowTime: Int?
    let dewPoint, humidity, pressure, windSpeed: Double?
    let windGust: Double?
    let windGustTime, windBearing: Int?
    let cloudCover: Double?
    let uvIndex, uvIndexTime: Int?
    let visibility, ozone, temperatureMin: Double?
    let temperatureMinTime: Int?
    let temperatureMax: Double?
    let temperatureMaxTime: Int?
    let apparentTemperatureMin: Double?
    let apparentTemperatureMinTime: Int?
    let apparentTemperatureMax: Double?
    let apparentTemperatureMaxTime: Int?
}



