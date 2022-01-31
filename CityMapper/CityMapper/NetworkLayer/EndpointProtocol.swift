//
//  EndpointProtocol.swift
//  CityMapper
//
//  Created by Debasish Chowdhury on 26/01/22.
//

import Foundation
protocol EndpointProtocol {
    
    var scheme: String { get }
    var baseURL: String { get }
    var path: String { get }
    var parameters: [URLQueryItem] { get }
    var method: String { get }
    
}
