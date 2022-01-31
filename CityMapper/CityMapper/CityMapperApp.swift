//
//  CityMapperApp.swift
//  CityMapper
//
//  Created by Debasish Chowdhury on 22/12/21.
//

import SwiftUI

@main
struct CityMapperApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(environment: CityMapperEnvironment())
        }
    }
}
