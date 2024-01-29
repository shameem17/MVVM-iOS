//
//  APIConstants.swift
//  WeatherApp
//
//  Created by Shameem on 28/1/24.
//

import Foundation

protocol API{
    var baseUrl: String { get }
    var path: String { get }
    var apiKey: String? { get }
}

enum APIConstants {
    case city
    case country
    case weather
}

extension APIConstants: API{
    
    
    var baseUrl: String {
        switch self{
        case .city:
            return "https://api.apilayer.com/"
        case .country:
            return "https://restcountries.com/"
        case .weather:
            return "https://api.weatherapi.com/"
        }
    }
    
    var path: String {
        switch self{
        case .city:
            return "geo/country/cities/"
        case .country:
            return "v3.1/all/"
        case .weather:
            return "/v1/current.json/"
        }
    }
    
    var apiKey: String? {
        switch self{
            
        case .city:
            return "eYvZel2XqS95RH0oo6Siotxik7G9YSGf"
        case .country:
            return nil
        case .weather:
            return "1f1c2b7ed5d74ad3ae160133231910"
        }
    }
    
    
}


