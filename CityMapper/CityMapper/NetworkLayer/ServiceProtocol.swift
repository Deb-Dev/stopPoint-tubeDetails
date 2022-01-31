//
//  ServiceProtocol.swift
//  CityMapper
//
//  Created by Debasish Chowdhury on 24/01/22.
//

import Foundation

protocol FetchTubePointsServiceProtocol {
    func fetchTubePoints(
        with lat: Double,
        and lon: Double,
        onCompletion handler: @escaping (Result<StopPoints,NetworkError>)->()
    )
}

protocol FetchTubeDetailsServiceProtocol {
    func fetchTubeDetails(
        with stopPointId: String,
        onCompletion handler: @escaping (Result<[TubeDetail],NetworkError>)->()
    )
}

