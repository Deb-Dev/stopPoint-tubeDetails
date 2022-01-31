//
//  HomeViewModelTest.swift
//  CityMapperTests
//
//  Created by Debasish Chowdhury on 26/01/22.
//

import XCTest
@testable import CityMapper


class HomeViewModelTest: XCTestCase {


    func testSuccess() throws {
        let mockEnvironment = MockEnvironment()
        mockEnvironment.success = true
        let homeViewModel = HomeViewModel(environment: mockEnvironment)
        homeViewModel.getHomeData()
        XCTAssertNotNil(homeViewModel.stopPoints)
    }
    
    func testFailure() throws {
        let mockEnvironment = MockEnvironment()
        mockEnvironment.success = false
        let homeViewModel = HomeViewModel(environment: mockEnvironment)
        homeViewModel.getHomeData()
        XCTAssert(homeViewModel.stopPoints.count == 0)
    }

}
