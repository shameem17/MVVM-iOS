//
//  HTTPEndPointsType.swift
//  WeatherApp
//
//  Created by Shameem on 28/1/24.
//

import Foundation
import Alamofire


protocol HTTPEndPointsType{
    var baseUrl: String { get }
    var path:String { get }
    var apiKey: String? { get }
    var url: URL? { get }
    var method: HTTPMethod { get }
    var body: Codable? { get }
    var header: [String: String]? { get }
    var queryParameters: [String: String]? { get }
}
