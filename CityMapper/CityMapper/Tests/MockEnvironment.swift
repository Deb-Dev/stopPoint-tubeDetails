//
//  MockEnvironment.swift
//  CityMapper
//
//  Created by Debasish Chowdhury on 26/01/22.
//

import Foundation
@testable import CityMapper
public final class MockEnvironment: FetchTubePointsServiceFactory, FetchTubeDetailsServiceFactory {
    public var success = true
    public func makefetchTubePointsService() -> FetchTubePointsServiceProtocol {
        MockFetchTubePointsService(succes: success)
    }
    
    public func makeTubeDetailsServiceFactory() -> FetchTubeDetailsServiceProtocol {
        MockFetchTubeDetailsService(succes: success)
    }
    
    
}
class MockFetchTubePointsService: FetchTubePointsServiceProtocol{
    var success: Bool
    init(succes: Bool){
        self.success = succes
    }
    func fetchTubePoints(with lat: Double, and lon: Double, onCompletion handler: @escaping (Result<StopPoints, NetworkError>) -> ()) {
        if success {
            handler(.success(StopPoints()))
        } else {
            handler(.failure(NetworkError.responseError))

        }
    }
    
    
}
class MockFetchTubeDetailsService: FetchTubeDetailsServiceProtocol{
    var success: Bool
    init(succes: Bool){
        self.success = succes
    }
    func fetchTubeDetails(with stopPointId: String, onCompletion handler: @escaping (Result<[TubeDetail], NetworkError>) -> ()) {
        if success {
            handler(.success([TubeDetail]()))
        } else {
            handler(.failure(NetworkError.responseError))

        }
    }
    
    
    
    
}
