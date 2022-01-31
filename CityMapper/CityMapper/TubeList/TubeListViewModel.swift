//
//  TubeListViewModel.swift
//  CityMapper
//
//  Created by Debasish Chowdhury on 13/01/22.
//

import Foundation
import Combine

class TubeListViewModel: ObservableObject {
    
    typealias Environment = FetchTubeDetailsServiceFactory
    
    
    init(environment: Environment) {
        self.environment = environment
    }
    private let environment: Environment

    private var cancellables = Set<AnyCancellable>()

    @Published var tubeDetails = [TubeDetail]()
    
    func getTubeDetailsData(for stationId: String) {
        
        environment.makeTubeDetailsServiceFactory().fetchTubeDetails(with: stationId) { result in
            switch result {
            case .success(let tubeDetails):
                
                DispatchQueue.main.async { [weak self] in
                    self?.tubeDetails = tubeDetails
                }
            case .failure(let error):
                
                print(error)
            }
        }
    }
    
}
