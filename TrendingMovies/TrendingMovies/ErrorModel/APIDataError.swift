//
//  ErrorModel.swift
//  TrendingMovies
//
//  Created by Shameem on 25/1/24.
//

import Foundation


enum APIDataError: Error{
    case invalidUrl
    case invalidData
    case parsingError
    case invalidResponse
    case error(_ error: Error?)
}

