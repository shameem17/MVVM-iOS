//
//  City.swift
//  WeatherApp
//
//  Created by Shameem on 29/1/24.
//

import Foundation

// MARK: - City
struct City: Codable {
    let geoID: Int
    let name, stateOrRegion: String
    let country: CityCountry
    let latitude, longitude: Double

    enum CodingKeys: String, CodingKey {
        case geoID = "geo_id"
        case name
        case stateOrRegion = "state_or_region"
        case country, latitude, longitude
    }
}

// MARK: - Country
struct CityCountry: Codable {
    let code: String
    let name: String
}

