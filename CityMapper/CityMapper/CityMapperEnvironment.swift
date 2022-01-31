//
//  CityMapperEnvironment.swift
//  CityMapper
//
//  Created by Debasish Chowdhury on 25/01/22.
//

import Foundation
class CityMapperEnvironment: FetchTubePointsServiceFactory {
    func makefetchTubePointsService() -> FetchTubePointsServiceProtocol {
        FetchTubePointsService()
    }
    
    
}
extension CityMapperEnvironment: FetchTubeDetailsServiceFactory {
    func makeTubeDetailsServiceFactory() -> FetchTubeDetailsServiceProtocol {
        FetchTubeDetailsService()
    }
    
    
}
