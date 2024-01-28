//
//  HomeCountryModel.swift
//  WeatherApp
//
//  Created by Shameem on 28/1/24.
//

import Foundation

// MARK: - Country
final class HomeCountryModel: Codable {
    let name: Name
    let cca2: String
    let capital: String
    let region: Region
    let latlng: String
    let flag: String
    let flags: Flags
    
    init(_ country: Country){
        self.name = country.name
        self.cca2 = country.cca2
        self.capital = country.capital?.first ?? ""
        self.region = country.region
        self.latlng = "\(country.latlng[0]), \(country.latlng[1])"
        self.flag = country.flag
        self.flags = country.flags
    }
}



