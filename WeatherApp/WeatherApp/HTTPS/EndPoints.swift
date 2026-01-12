//
//  EndPoints.swift
//  WeatherApp
//
//  Created by Shameem on 28/1/24.
//

import Foundation
import Alamofire

enum EndPoints{
    case contry
    case city(countryCode: String)
    case weatherByLatlong(lat: Double?, long: Double?)
    case weatherByPlace(place: String)
}


extension EndPoints: EndPointItems{
    
    var baseUrl: String {
        switch self{
        case .city:
            return APIConstants.city.baseUrl
        case .contry:
            return APIConstants.country.baseUrl
        case .weatherByLatlong:
            return APIConstants.weather.baseUrl
        case .weatherByPlace:
            return APIConstants.weather.baseUrl
        }
    }
    
    var path: String {
        switch self{
        case .contry:
            return APIConstants.country.path
        case .city:
            return APIConstants.city.path
        case .weatherByLatlong:
            return APIConstants.weather.path
        case .weatherByPlace:
            return APIConstants.weather.path
        }
    }
    
    var apiKey: String? {
        switch self{
        case .contry:
            return APIConstants.country.apiKey
        case .city:
            return APIConstants.city.apiKey
        case .weatherByLatlong:
            return APIConstants.weather.apiKey
        case .weatherByPlace:
            return APIConstants.weather.apiKey
        }
    }
    
    var url: URL? {
        switch self {
        case .city(let countryCode):
            return URL(string: "\(baseUrl)\(path)\(countryCode)")
        case .weatherByPlace(place: let place):
            return URL(string: "\(baseUrl)\(path)?key=\(APIConstants.weather.apiKey ?? "")&q=\(place)")
        case .weatherByLatlong(lat: let lat, long: let long):
            if let latitude = lat, let longitude = long{
                return URL(string: "\(baseUrl)\(path)?key=\(APIConstants.weather.apiKey ?? "")&q=\(latitude),\(longitude)")
            }else{
                return URL(string: "\(baseUrl)\(path)?key=\(APIConstants.weather.apiKey ?? "")")
            }
        default:
            return URL(string: "\(baseUrl)\(path)")
        }
    }
    var method: HTTPMethod {
        //all get method so get to all
        return .get
    }
    
    var body: [String: Any]? {
        get{
            switch self{
            case .contry:
                return ["fields": "name,flag,flags,capital,latlng"]
            case .city:
                return nil
            case .weatherByLatlong:
                return nil
            case .weatherByPlace:
                return nil
            }
        }
        set{
            // = newValue
        }
    }
    
    var header: HTTPHeaders? {
        switch self{
        case .contry:
            return APIConstants.country.header
        case .city:
            return APIConstants.city.header
        case .weatherByLatlong:
            return APIConstants.weather.header
        case .weatherByPlace:
            return APIConstants.weather.header
        }
    }
    
    var queryParameters: [String : String]? {
        switch self{
            
        case .contry:
            return ["fields": "name"]
        case .city(let countryCode):
            return ["countryCode": countryCode]
        case .weatherByLatlong:
            return ["key": APIConstants.weather.apiKey ?? ""]
        case .weatherByPlace(place: let place):
            return ["key": APIConstants.weather.apiKey ?? "",
                    "q": place
            ]
        }
    }
    
    
}
