// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let weather = try? newJSONDecoder().decode(Weather.self, from: jsonData)

import Foundation

// MARK: - Weather
struct Weather: Codable {
    let latitude, longitude: Double?
    let timezone: String?
    let currently: Currently?
    let minutely: Minutely?
    let hourly: Hourly?
    let daily: Daily?
    let flags: Flags?
    let offset: Int?
    
    
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

// MARK: - Currently
struct Currently: Codable {
    let time: Int?
    let summary: Summary?
    let icon: Icon?
    let precipIntensity, precipProbability, temperature, apparentTemperature: Double?
    let dewPoint, humidity, pressure, windSpeed: Double?
    let windGust: Double?
    let windBearing: Int?
    let cloudCover: Double?
    let uvIndex: Int?
    let visibility, ozone: Double?
    let precipType: PrecipType?
}

enum Icon: String, Codable {
    case clearDay = "clear-day"
    case clearNight = "clear-night"
    case cloudy = "cloudy"
    case partlyCloudyDay = "partly-cloudy-day"
    case partlyCloudyNight = "partly-cloudy-night"
}

enum PrecipType: String, Codable {
    case rain = "rain"
}

enum Summary: String, Codable {
    case clear = "Clear"
    case mostlyCloudy = "Mostly Cloudy"
    case overcast = "Overcast"
    case partlyCloudy = "Partly Cloudy"
}

// MARK: - Daily
struct Daily: Codable {
    let summary: String?
    let icon: Icon?
    let data: [DailyDatum]?
}

// MARK: - DailyDatum
struct DailyDatum: Codable {
    let time: Int?
    let summary: String?
    let icon: Icon?
    let sunriseTime, sunsetTime: Int?
    let moonPhase, precipIntensity, precipIntensityMax: Double?
    let precipIntensityMaxTime: Int?
    let precipProbability: Double?
    let precipType: PrecipType?
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

// MARK: - Flags
struct Flags: Codable {
    let sources: [String]?
    let nearestStation: Double?
    let units: String?

    enum CodingKeys: String, CodingKey {
        case sources
        case nearestStation = "nearest-station"
        case units
    }
}

// MARK: - Hourly
struct Hourly: Codable {
    let summary: String?
    let icon: Icon?
    let data: [Currently]?
}

// MARK: - Minutely
struct Minutely: Codable {
    let summary: String?
    let icon: Icon?
    let data: [MinutelyDatum]?
}

// MARK: - MinutelyDatum
struct MinutelyDatum: Codable {
    let time, precipIntensity, precipProbability: Int?
}
