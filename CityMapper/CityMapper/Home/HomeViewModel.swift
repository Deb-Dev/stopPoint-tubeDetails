//
//  HomeViewModel.swift
//  CityMapper
//
//  Created by Debasish Chowdhury on 23/12/21.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    typealias Environment = FetchTubePointsServiceFactory
    init(environment: Environment) {
        self.environment = environment
    }
    
    private let environment: Environment

    @Published var stopPoints = [StopPoint]()
    
    func getHomeData() {
        environment.makefetchTubePointsService().fetchTubePoints(with: 51.5072, and: -0.1276) { result in
            switch result {
            case .success(let stopPoints):
                DispatchQueue.main.async {
                    self.stopPoints = stopPoints.stopPoints ?? [StopPoint]()
                }
            case .failure(let error):
                print(error)
            }
        }
        
        }
    }
