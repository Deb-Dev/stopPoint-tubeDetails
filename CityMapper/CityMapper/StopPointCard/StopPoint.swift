//
//  StopPoint.swift
//  CityMapper
//
//  Created by Debasish Chowdhury on 24/12/21.
//

import Foundation
struct StopPoint: Decodable, Hashable {
    var id: String
    var stopType: String?
    var stationNaptan: String?
    var hubNaptanCode: String?
    var commonName: String?
    var distance: Double?
    var additionalProperties: [AdditionalProperties]?
    
}
struct AdditionalProperties: Decodable, Hashable {
    var category: String
    var key: String
    var sourceSystemKey: String?
    var value: String?
}
extension StopPoint {
    func getFacilities() -> [String]? {
        additionalProperties?.filter({ $0.category == "Facility" && $0.value == "yes"}).map({ $0.key})
    }
}
