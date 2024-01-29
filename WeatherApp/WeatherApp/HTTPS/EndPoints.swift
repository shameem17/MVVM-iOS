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
    case city
    case weatherByLatlong
    case weatherByPlace
}


extension EndPoints: HTTPEndPointsType{
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
        return URL(string: "\(baseUrl)\(path)")

    }
    var method: HTTPMethod {
        //all get method so get to all
        return .get
    }
    
    var body: Codable? {
        switch self{
        case .contry:
            return nil
        case .city:
            return nil
        case .weatherByLatlong:
            return nil
        case .weatherByPlace:
            return nil
        }
    }
    
    var header: [String : String]? {
        switch self{
            
        case .contry:
            return nil
        case .city:
            return nil
        case .weatherByLatlong:
            return nil
        case .weatherByPlace:
            return nil
        }
    }
    
    var queryParameters: [String : String]? {
        switch self{
            
        case .contry:
            return nil
        case .city:
            return nil
        case .weatherByLatlong:
            return nil
        case .weatherByPlace:
            return nil
        }
    }
    
    
}
