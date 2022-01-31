//
//  TubeEndpoint.swift
//  CityMapper
//
//  Created by Debasish Chowdhury on 26/01/22.
//

import Foundation

enum TubeEndpoint: EndpointProtocol {
    
    case getTubePoints(lat: Double, long: Double)
    case getTubes(stopPointId: String)
    
    
    var scheme: String { switch self { default:
        return "https"}
    }
    
    var baseURL: String { switch self { default:
        return "api.tfl.gov.uk"}
    }
    var path: String { switch self {
    case .getTubePoints:
        return "/Stoppoint"
    case .getTubes(stopPointId: let stopPointId):
        return "/StopPoint/\(stopPointId)/Arrivals"
    }
        
    }
    
    var parameters: [URLQueryItem] {
        
        let apiKey = "cb1145a03c9c4984baf221fb08fbece0"
        
        switch self {
            
        case .getTubePoints(lat: let latVal, long: let longVal):
            return [URLQueryItem(name: "radius", value: "\(1000)"),
                    URLQueryItem(name: "modes", value: "tube"),
                    URLQueryItem(name: "app_key", value: apiKey),
                    URLQueryItem(name: "lon", value: "\(longVal)"),
                    URLQueryItem(name: "lat", value: "\(latVal)"),
                    URLQueryItem(name: "stoptypes", value: "NaptanMetroStation,NaptanRailStation")
            ]
            
            
        case .getTubes:
            return [URLQueryItem(name: "modes", value: "tube"),
                    URLQueryItem(name: "app_key", value: apiKey),
            ]
        }
        
        
    }
    
    
    var method: String { switch self { default:
        return "GET"}
    }
}
