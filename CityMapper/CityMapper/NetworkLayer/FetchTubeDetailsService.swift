//
//  FetchTubeDetailsService.swift
//  CityMapper
//
//  Created by Debasish Chowdhury on 26/01/22.
//

import Foundation
protocol FetchTubeDetailsServiceFactory {
    func makeTubeDetailsServiceFactory() -> FetchTubeDetailsServiceProtocol

}

class FetchTubeDetailsService: FetchTubeDetailsServiceProtocol {
    func fetchTubeDetails(with stopPointId: String, onCompletion handler: @escaping (Result<[TubeDetail], NetworkError>) -> ()) {
        NetworkEngine.shared.getData(endpoint: TubeEndpoint.getTubes(stopPointId: stopPointId), type: [TubeDetail].self) { result in
            switch result
            {
            case .failure(let error):
                handler(.failure(error as! NetworkError))
            case .success(let tubeDetails):
                handler(.success(tubeDetails))
            }
        }
    }
    
}
