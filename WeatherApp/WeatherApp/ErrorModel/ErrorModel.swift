//
//  ErrorModel.swift
//  WeatherApp
//
//  Created by Shameem on 28/1/24.
//

import Foundation

enum ErrorModel: Error{
    
}
enum APIError: Error{
    case invalidUrl
    case invalidData
    case invalidResponse
    case parsingError
    case error(_ message : Error?)
}
