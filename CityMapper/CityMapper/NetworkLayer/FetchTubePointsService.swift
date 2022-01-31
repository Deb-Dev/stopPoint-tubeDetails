//
//  FetchTubePointsService.swift
//  CityMapper
//
//  Created by Debasish Chowdhury on 26/01/22.
//

import Foundation

protocol FetchTubePointsServiceFactory {
    func makefetchTubePointsService() -> FetchTubePointsServiceProtocol

}
class FetchTubePointsService: FetchTubePointsServiceProtocol {

    func fetchTubePoints(with lat: Double, and lon: Double, onCompletion handler: @escaping (Result<StopPoints, NetworkError>) -> ()) {
        
        NetworkEngine.shared.getData(endpoint: TubeEndpoint.getTubePoints(lat: lat, long: lon), type: StopPoints.self) { result in
            switch result
            {
            case .failure(let error):
                handler(.failure(error as! NetworkError))
            case .success(let stopPoints):
                handler(.success(stopPoints))
            }
        }
    }
    
    
}
    
