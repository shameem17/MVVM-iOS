//
//  Country.swift
//  WeatherApp
//
//  Created by Shameem on 28/1/24.
//

import Foundation


// MARK: - Country
struct Country: Codable {
    let name: Name
    let tld: [String]?
    let cca2: String
    let independent: Bool?
    let capital: [String]?
    let region: Region
    let languages: [String: String]?
    let latlng: [Double]
    let flag: String
    let maps: Maps
    let population: Int
    let fifa: String?
    let flags: Flags
}


// MARK: - Flags
struct Flags: Codable {
    let png: String
    let svg: String
    let alt: String?
}



// MARK: - Maps
struct Maps: Codable {
    let googleMaps, openStreetMaps: String
}

// MARK: - Name
struct Name: Codable {
    let common, official: String
    let nativeName: [String: Translation]?
}

// MARK: - Translation
struct Translation: Codable {
    let official, common: String
}



enum Region: String, Codable {
    case africa = "Africa"
    case americas = "Americas"
    case antarctic = "Antarctic"
    case asia = "Asia"
    case europe = "Europe"
    case oceania = "Oceania"
}


