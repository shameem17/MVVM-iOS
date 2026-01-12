//
//  CityModel.swift
//  WeatherApp
//
//  Created by Shameem on 10/1/26.
//

import Foundation

final class CityModel {
    let name: String
    let stateOrRegion: String
    let countryName: String
    let countryCode: String
    let latitude: Double
    let longitude: Double
    
    init(_ city: City) {
        self.name = city.name
        self.stateOrRegion = city.stateOrRegion
        self.countryName = city.country.name
        self.countryCode = city.country.code
        self.latitude = city.latitude
        self.longitude = city.longitude
    }
}
