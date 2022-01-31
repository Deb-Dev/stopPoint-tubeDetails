//
//  TubeDetails.swift
//  CityMapper
//
//  Created by Debasish Chowdhury on 13/01/22.
//

import Foundation

import Foundation

struct TubeDetail: Decodable, Hashable {
    var id: String
    var operationType: Int?
    var vehicleId: String?
    var naptanId: String?
    var stationName: String?
    var lineId: String?
    var lineName: String?
    var platformName: String?
    var direction: String?
    var bearing: String?
    var destinationNaptanId: String?
    var destinationName: String?
    var timestamp: String?
    var timeToStation: Int?
    var currentLocation: String?
    var towards: String?
    var expectedArrival: String?
    var timeToLive: String?
    
}
